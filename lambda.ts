import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import { GetValue } from "./getValue";

//https://www.pulumi.com/registry/packages/aws/api-docs/lambda/function/
export const create = async (config: {
  lambdaNames: string[];
  env: string;
  roleArn: string;
  tags: { [key: string]: string };
  vpc: { id: string; securityGroupIds: string[]; subnetIds: string[] };
  lambdaConfig: {
    nodeRuntime: string;
    timeoutInSeconds: number;
    memoryInMBs: number;
    aliases: string[];
    invokeConfig: {
      maximumEventAgeInSeconds: number;
      maximumRetryAttempts: number;
    };
  };
  sqsConfig: {
    fifoQueue: boolean;
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  };
  isTriggerCreatedOnProdAlias: boolean;
  skipCreatingTrigger: boolean;
  dlqTrigger: boolean;
}) => {
  //{lambdaName: string;lambdaUri: string;sqsName: string;sqsUri: string;}
  let result: any = [];
  config.lambdaNames.forEach(async (lambdaName: string) => {
    console.log(`Processing lambda: ${lambdaName} >>>>>>>>`);
    lambdaName = lambdaName.toLowerCase();

    const name = `${config.env}-${lambdaName}`.toLowerCase();
    config.tags["Env"] = config.env.toUpperCase();

    const existingLambda = await getLambda(name);
    let lambdaArn = existingLambda.arn;
    let lambdaTriggerArn: string = "";
    if (!lambdaArn) {
      lambdaArn = await createLambda(
        name,
        config.roleArn,
        config.tags,
        config.vpc,
        config.lambdaConfig
      );

      if (config.lambdaConfig.invokeConfig) {
        await setLambdaEventInvokeConfig(
          lambdaName.toLowerCase(),
          config.lambdaConfig.invokeConfig
        );
      }

      const lambdaAliasArn = await createLambdaAlias(
        lambdaName,
        lambdaArn,
        config.env
      );

      lambdaTriggerArn = config.isTriggerCreatedOnProdAlias
        ? lambdaAliasArn
        : lambdaArn;
    }

    const queueResult = await createSqs(
      lambdaName,
      config.env,
      config.tags,
      config.sqsConfig,
      false
    );

    if (!config.skipCreatingTrigger) {
      await createTrigger(
        lambdaName,
        config.env,
        false,
        lambdaTriggerArn,
        queueResult.sqsArn,
        config?.sqsConfig?.batchSize || 10
      );
    }

    if (config.dlqTrigger) {
      const dlq1Result = await createSqs(
        lambdaName,
        config.env,
        config.tags,
        config.sqsConfig,
        true
      );

      if (!config.skipCreatingTrigger) {
        await createTrigger(
          lambdaName,
          config.env,
          true,
          lambdaTriggerArn,
          dlq1Result.sqsArn,
          config?.sqsConfig?.batchSize || 10
        );
      }
    }

    if (config.lambdaConfig.aliases && config.lambdaConfig.aliases.length > 0) {
      const nameShared = `shared-${lambdaName}`.toLowerCase();
      config.tags["Env"] = "SHARED";
      const lambdaSharedArn = await createLambda(
        nameShared,
        config.roleArn,
        config.tags,
        config.vpc,
        config.lambdaConfig
      );

      if (config.lambdaConfig.invokeConfig) {
        await setLambdaEventInvokeConfig(
          nameShared.toLowerCase(),
          config.lambdaConfig.invokeConfig
        );
      }

      config.lambdaConfig.aliases.forEach(async (alias) => {
        alias = alias.toLowerCase();
        console.log(`Processing alias: ${alias} >>>>>>>>`);

        const lambdaAliasArn = await createLambdaAlias(
          lambdaName,
          lambdaSharedArn,
          alias
        );

        config.tags["Env"] = alias.toUpperCase();
        const queueResult = await createSqs(
          lambdaName,
          config.env,
          config.tags,
          config.sqsConfig,
          false
        );

        if (!config.skipCreatingTrigger) {
          await createTrigger(
            lambdaName,
            config.env,
            false,
            lambdaAliasArn,
            queueResult.sqsArn,
            config?.sqsConfig?.batchSize || 10
          );
        }

        if (config.dlqTrigger) {
          const dlq1Result = await createSqs(
            lambdaName,
            config.env,
            config.tags,
            config.sqsConfig,
            true
          );

          if (!config.skipCreatingTrigger) {
            await createTrigger(
              lambdaName,
              config.env,
              true,
              lambdaAliasArn,
              dlq1Result.sqsArn,
              config?.sqsConfig?.batchSize || 10
            );
          }
        }
      });
    }
  });

  return result;
};

const createLambda = async (
  lambdaName: string,
  roleArn: string,
  tags: { [key: string]: string },
  vpc: { id: string; securityGroupIds: string[]; subnetIds: string[] },
  config: {
    nodeRuntime: string;
    timeoutInSeconds: number;
    memoryInMBs: number;
    aliases: string[];
    invokeConfig: {
      maximumEventAgeInSeconds: number;
      maximumRetryAttempts: number;
    };
  }
): Promise<string> => {
  lambdaName = lambdaName.toLowerCase();
  tags["name"] = lambdaName;
  tags["Service"] = "Lambda";
  const fn = new aws.lambda.Function(`${lambdaName}`, {
    name: `${lambdaName}`,
    vpcConfig: {
      securityGroupIds: vpc.securityGroupIds,
      subnetIds: vpc.subnetIds,
    },
    tags: tags,
    role: roleArn,
    handler: "index.handler",
    runtime: config.nodeRuntime,
    timeout: config.timeoutInSeconds,
    memorySize: config.memoryInMBs,
    architectures: ["x86_64"],
    code: new pulumi.asset.AssetArchive({
      "index.js": new pulumi.asset.StringAsset(
        "exports.handler = (e, c, cb) => cb(null, {statusCode: 200, body: 'Hello, world!'});"
      ),
    }),
  });

  var arn = await GetValue(fn.arn);

  console.log(`lambda ===========`);
  console.log(`lambdaName: ${lambdaName}`);
  console.log(`arn: ${arn}`);
  return arn;
};

const createLambdaAlias = async (
  lambdaName: string,
  lambdaArn: string,
  alias: string
): Promise<string> => {
  const lambdaAlias = new aws.lambda.Alias(`${alias}-${lambdaName}`, {
    name: `${alias}`,
    functionName: lambdaArn,
    functionVersion: "$LATEST",
  });

  const arn = await GetValue(lambdaAlias.arn);
  console.log(`lambda alias ===========`);
  console.log(`alias: ${alias}`);
  console.log(`arn: ${arn}`);
  return arn;
};

const createFifoSqs = async (
  lambdaName: string,
  alias: string,
  tags: { [key: string]: string },
  config: {
    fifoQueue: boolean;
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  let queueName = `${alias}-${lambdaName}.fifo`.replace("lambda", "queue");
  queueName = queueName.toLowerCase();
  tags["name"] = queueName;
  tags["Service"] = "Queue";
  const queue = new aws.sqs.Queue(queueName, {
    name: queueName,
    fifoQueue: true,
    visibilityTimeoutSeconds: config.visibilityTimeoutInSeconds,
    deduplicationScope: "messageGroup",
    fifoThroughputLimit: "perMessageGroupId",
    tags: tags,
  });
  const arn = await GetValue(queue.arn);
  const url = await GetValue(queue.url);
  console.log(`sqs ===========`);
  console.log(`queueName: ${queueName}`);
  console.log(`arn: ${arn}`);
  console.log(`url: ${url}`);
  return { arn, url };
};

const createStandardSqs = async (
  lambdaName: string,
  alias: string,
  tags: { [key: string]: string },
  config: {
    fifoQueue: boolean;
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  let queueName = `${alias}-${lambdaName}`.replace("lambda", "queue");
  queueName = queueName.toLowerCase();

  tags["name"] = queueName;
  tags["Service"] = "Queue";
  const queue = new aws.sqs.Queue(queueName, {
    name: queueName,
    fifoQueue: false,
    visibilityTimeoutSeconds: config.visibilityTimeoutInSeconds,
    tags: tags,
  });
  const arn = await GetValue(queue.arn);
  const url = await GetValue(queue.url);
  console.log(`sqs ===========`);
  console.log(`queueName: ${queueName}`);
  console.log(`arn: ${arn}`);
  console.log(`url: ${url}`);
  return { arn, url };
};

const createSqs = async (
  lambdaName: string,
  alias: string,
  tags: { [key: string]: string },
  sqsConfig: {
    fifoQueue: boolean;
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  },
  dlqQueue: boolean
): Promise<{ sqsArn: string; sqsUrl: string }> => {
  let sqsArn: string = "";
  let sqsUrl: string = "";

  const dlqText = dlqQueue ? "dlq1-" : "";
  let queueName = `${alias}-${dlqText}${lambdaName}`.replace("lambda", "queue");
  queueName = sqsConfig.fifoQueue ? queueName + ".fifo" : queueName;
  queueName = queueName.toLowerCase();
  const existingQueue = await getQueue(queueName);
  sqsArn = existingQueue.arn;
  sqsUrl = existingQueue.url;

  if (!sqsArn) {
    console.log(`createSqs: ${queueName} does not exist, so creating it...`);
    if (sqsConfig?.fifoQueue) {
      const data = await createFifoSqs(lambdaName, alias, tags, sqsConfig);
      sqsArn = data.arn;
      sqsUrl = data.url;
    }

    if ((sqsConfig?.fifoQueue || false) == false) {
      const data = await createStandardSqs(lambdaName, alias, tags, sqsConfig);
      sqsArn = data.arn;
      sqsUrl = data.url;
    }
  }
  return { sqsArn, sqsUrl };
};

const createTrigger = async (
  lambdaName: string,
  alias: string,
  dlqQueue: boolean,
  lambdaArn: string,
  sqsArn: string,
  batchSize: number
): Promise<string> => {
  const dlqText = dlqQueue ? "dlq-" : "";
  const name = `${alias}-${lambdaName}-${dlqText}trigger`;
  const lambdaSqsMapping = new aws.lambda.EventSourceMapping(name, {
    eventSourceArn: sqsArn,
    functionName: lambdaArn,
    batchSize: batchSize,
  });
  const id = await GetValue(lambdaSqsMapping.id);
  console.log(`trigger ===========`);
  console.log(`lambdaName: ${lambdaName}`);
  console.log(`alias: ${alias}`);
  console.log(`lambdaArn: ${lambdaArn}`);
  console.log(`sqsArn: ${sqsArn}`);
  return id;
};

const getQueue = async (name: string): Promise<aws.sqs.GetQueueResult> => {
  let existing: aws.sqs.GetQueueResult = {
    arn: "",
    id: "",
    name: "",
    tags: {},
    url: "",
  };

  try {
    existing = await aws.sqs.getQueue({
      name: name,
    });

    console.log(`getQueue: Name: ${name} \r\n Arn: ${existing.arn}`);
  } catch (error) {
    console.log(`getQueue: Name: ${name} \r\n Warning: ${error}`);
  }

  return existing;
};

const getLambda = async (
  name: string
): Promise<aws.lambda.GetFunctionResult> => {
  let existing: aws.lambda.GetFunctionResult = {
    arn: "",
    id: "",
    tags: {},
    architectures: [],
    codeSigningConfigArn: "",
    deadLetterConfig: { targetArn: "" },
    description: "",
    environment: { variables: {} },
    ephemeralStorages: [],
    fileSystemConfigs: [],
    functionName: "",
    handler: "",
    imageUri: "",
    invokeArn: "",
    kmsKeyArn: "",
    lastModified: "",
    layers: [],
    memorySize: 0,
    qualifiedArn: "",
    qualifiedInvokeArn: "",
    reservedConcurrentExecutions: 0,
    role: "",
    runtime: "",
    signingJobArn: "",
    signingProfileVersionArn: "",
    sourceCodeHash: "",
    sourceCodeSize: 0,
    timeout: 0,
    tracingConfig: { mode: "" },
    version: "",
    vpcConfig: { securityGroupIds: [], subnetIds: [], vpcId: "" },
  };

  try {
    existing = await aws.lambda.getFunction({
      functionName: name,
    });
  } catch (error) {
    console.log(`getLambda: Name: ${name} \r\n Warning: ${error}`);
  }

  return existing;
};

const setLambdaEventInvokeConfig = async (
  name: string,
  invokeConfig: {
    maximumEventAgeInSeconds: number;
    maximumRetryAttempts: number;
  }
) => {
  const example = new aws.lambda.FunctionEventInvokeConfig(
    `${name}-invoke-config`,
    {
      functionName: name,
      maximumEventAgeInSeconds: invokeConfig.maximumEventAgeInSeconds,
      maximumRetryAttempts: invokeConfig.maximumRetryAttempts,
    }
  );
};

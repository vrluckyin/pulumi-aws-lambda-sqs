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
  fifoSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  };
  standardSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  };
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
        config.env.toUpperCase()
      );
    }

    await createMapping(
      lambdaName,
      lambdaArn,
      config.env,
      config.tags,
      config.fifoSqsConfig,
      config.standardSqsConfig
    );

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
        await createMapping(
          lambdaName,
          lambdaAliasArn,
          alias,
          config.tags,
          config.fifoSqsConfig,
          config.standardSqsConfig
        );
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
  alias = alias.toLowerCase();

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
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  const queueName = `${alias}-${lambdaName}.fifo`.replace("lambda", "queue");
  const existingQueue = await getQueue(queueName);
  let arn = existingQueue.arn;
  let url = existingQueue.url;
  if (!existingQueue.arn) {
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
    arn = await GetValue(queue.arn);
    url = await GetValue(queue.url);
    console.log(`sqs ===========`);
    console.log(`queueName: ${queueName}`);
    console.log(`arn: ${arn}`);
    console.log(`url: ${url}`);
  }
  return { arn, url };
};

const createStandardSqs = async (
  lambdaName: string,
  alias: string,
  tags: { [key: string]: string },
  config: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  const queueName = `${alias}-${lambdaName}`.replace("lambda", "queue");

  const existingQueue = await getQueue(queueName);
  let arn = existingQueue.arn;
  let url = existingQueue.url;
  if (!existingQueue.arn) {
    tags["name"] = queueName;
    tags["Service"] = "Queue";
    const queue = new aws.sqs.Queue(queueName, {
      name: queueName,
      fifoQueue: false,
      visibilityTimeoutSeconds: config.visibilityTimeoutInSeconds,
      tags: tags,
    });
    arn = await GetValue(queue.arn);
    url = await GetValue(queue.url);
    console.log(`sqs ===========`);
    console.log(`queueName: ${queueName}`);
    console.log(`arn: ${arn}`);
    console.log(`url: ${url}`);
  }
  return { arn, url };
};

const createSqs = async (
  lambdaName: string,
  alias: string,
  tags: { [key: string]: string },
  fifoSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  },
  standardSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ sqsArn: string; sqsUrl: string }> => {
  let sqsArn: string = "";
  let sqsUrl: string = "";
  if (fifoSqsConfig) {
    const data = await createFifoSqs(lambdaName, alias, tags, fifoSqsConfig);
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  if (standardSqsConfig) {
    const data = await createStandardSqs(
      lambdaName,
      alias,
      tags,
      standardSqsConfig
    );
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  return { sqsArn, sqsUrl };
};

const createTrigger = async (
  lambdaName: string,
  alias: string,
  lambdaArn: string,
  sqsArn: string,
  batchSize: number
): Promise<string> => {
  const name = `${alias}-${lambdaName}-trigger`;
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

const createMapping = async (
  lambdaName: string,
  lambdaArn: string,
  alias: string,
  tags: { [key: string]: string },
  fifoSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  },
  standardSqsConfig?: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ lambdaName: string; alias: string; sqsUrl: string }> => {
  let sqsArn: string = "";
  let sqsUrl: string = "";
  if (fifoSqsConfig) {
    const data = await createFifoSqs(lambdaName, alias, tags, fifoSqsConfig);
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  if (standardSqsConfig) {
    const data = await createStandardSqs(
      lambdaName,
      alias,
      tags,
      standardSqsConfig
    );
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  const triggerArn = await createTrigger(
    lambdaName,
    alias,
    lambdaArn,
    sqsArn,
    fifoSqsConfig?.batchSize || standardSqsConfig?.batchSize || 10
  );
  return { lambdaName: lambdaName, alias: alias, sqsUrl: sqsUrl };
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
  } catch (error) {
    console.log(`getQueue: Name: ${name} \r\nERROR: ${error}`);
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
    console.log(`getLambda: Name: ${name} \r\nERROR: ${error}`);
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

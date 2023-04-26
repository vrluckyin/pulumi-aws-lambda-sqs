import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import { GetValue } from "./getValue";

//https://www.pulumi.com/registry/packages/aws/api-docs/lambda/function/
export const create = async (config: {
  lambdaNames: string[];
  roleArn: string;
  vpc: { id: string; securityGroupIds: string[]; subnetIds: string[] };
  lambdaConfig: {
    nodeRuntime: string;
    timeoutInSeconds: number;
    memoryInMBs: number;
    aliases: string[];
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
    const name = `prod-${lambdaName}`.toLowerCase();
    const lambdaArn = await createLambda(
      name,
      config.roleArn,
      config.vpc,
      config.lambdaConfig
    );

    config.lambdaConfig.aliases.forEach(async (alias) => {
      alias = alias.toLowerCase();
      console.log(`Processing alias: ${alias} >>>>>>>>`);

      const lambdaAliasArn = await createLambdaAlias(
        lambdaName,
        lambdaArn,
        alias
      );

      let sqsArn: string = "";
      if (config.fifoSqsConfig) {
        const data = await createFifoSqs(
          lambdaName,
          alias,
          config.fifoSqsConfig
        );
        sqsArn = data.arn;
        result.push({ lambdaName: lambdaName, alias: alias, sqsUrl: data.url });
      }

      if (config.standardSqsConfig) {
        const data = await createStandardSqs(
          lambdaName,
          alias,
          config.standardSqsConfig
        );
        sqsArn = data.arn;
        result.push({ lambdaName: lambdaName, alias: alias, sqsUrl: data.url });
      }

      const fifoTriggerArn = await createTrigger(
        lambdaName,
        alias,
        lambdaAliasArn,
        sqsArn,
        config?.fifoSqsConfig?.batchSize ||
          config?.standardSqsConfig?.batchSize ||
          10
      );
    });
  });

  return result;
};

const createLambda = async (
  lambdaName: string,
  roleArn: string,
  vpc: { id: string; securityGroupIds: string[]; subnetIds: string[] },
  config: {
    nodeRuntime: string;
    timeoutInSeconds: number;
    memoryInMBs: number;
    aliases: string[];
  }
): Promise<string> => {
  lambdaName = lambdaName.toLowerCase();
  const fn = new aws.lambda.Function(`${lambdaName}`, {
    name: `${lambdaName}`,
    vpcConfig: {
      securityGroupIds: vpc.securityGroupIds,
      subnetIds: vpc.subnetIds,
    },
    tags: {
      name: lambdaName,
      Service: "Lambda",
      Feature: "PMS_SYNC",
      "Sub-Feature": "VRM",
    },
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

  const lambdaAlias = new aws.lambda.Alias(`${lambdaName}-${alias}`, {
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
  config: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  const queueName = `${lambdaName}-${alias}.fifo`;

  const queue = new aws.sqs.Queue(queueName, {
    name: queueName,
    fifoQueue: true,
    visibilityTimeoutSeconds: config.visibilityTimeoutInSeconds,
    deduplicationScope: "messageGroup",
    fifoThroughputLimit: "perMessageGroupId",
    tags: {
      name: queueName,
      Service: "Queue",
      Feature: "PMS_SYNC",
      "Sub-Feature": "VRM",
    },
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
  config: {
    visibilityTimeoutInSeconds: number;
    batchSize: number;
  }
): Promise<{ arn: string; url: string }> => {
  const queueName = `${lambdaName}-${alias}`.replace("lambda", "queue");

  const queue = new aws.sqs.Queue(queueName, {
    name: queueName,
    fifoQueue: false,
    visibilityTimeoutSeconds: config.visibilityTimeoutInSeconds,
  });
  const arn = await GetValue(queue.arn);
  const url = await GetValue(queue.url);
  console.log(`sqs ===========`);
  console.log(`queueName: ${queueName}`);
  console.log(`arn: ${arn}`);
  console.log(`url: ${url}`);
  return { arn, url };
};

const createTrigger = async (
  lambdaName: string,
  alias: string,
  lambdaArn: string,
  sqsArn: string,
  batchSize: number
): Promise<string> => {
  const name = `${lambdaName}-${alias}-trigger`;
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
    const data = await createFifoSqs(lambdaName, alias, fifoSqsConfig);
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  if (standardSqsConfig) {
    const data = await createStandardSqs(lambdaName, alias, standardSqsConfig);
    sqsArn = data.arn;
    sqsUrl = data.url;
  }

  const fifoTriggerArn = await createTrigger(
    lambdaName,
    alias,
    lambdaArn,
    sqsArn,
    fifoSqsConfig?.batchSize || standardSqsConfig?.batchSize || 10
  );
  return { lambdaName: lambdaName, alias: alias, sqsUrl: sqsUrl };
};

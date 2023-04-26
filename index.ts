import * as pulumi from "@pulumi/pulumi";
import * as fs from "fs";
import * as lambda from "./lambda";

export = async () => {
  let vkConfig = new pulumi.Config("vk");
  let paramFile = pulumi.getStack();
  paramFile = paramFile + ".json";
  console.log(`==================`);
  console.log(`paramFile: ${paramFile}`);
  let stack = pulumi.getStack();
  try {
    const jsonString = fs.readFileSync(`./config/${paramFile.trim()}`, "utf-8");
    const lambdaParams = JSON.parse(jsonString);
    await lambda.create(lambdaParams);
  } catch (err) {
    console.log(`ERROR: ${err}`);
    return;
  }
};

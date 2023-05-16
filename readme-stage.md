aws lambda update-function-configuration --timeout 300 --region us-east-1 --function-name prod-automation_feeder-lambda

pulumi login <backend-url>

pulumi stack init <<stack name as per your json file>>
pulumi stack select <<stack name as per your json file>>
pulumi config set aws:region us-east-1
pulumi up --stack <<stack name as per your json file>>

Examples:

pulumi login s3://lynx-pulumi-state/dev/?region=us-east-1&awssdk=v2
pulumi stack init vipul-stage-cli-update-lambda
pulumi stack select vipul-stage-cli-update-lambda
pulumi config set aws:region us-east-1
pulumi up --stack vipul-stage-cli-update-lambda --yes
pulumi destroy --stack vipul-stage-cli-update-lambda --yes
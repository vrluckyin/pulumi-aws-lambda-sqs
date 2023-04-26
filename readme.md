aws lambda update-function-configuration --function-name prod-automation_feeder-lambda --timeout 300 --region us-east-1

pulumi login <backend-url>
pulumi stack init <<stack name as per your json file>>
pulumi stack select <<stack name as per your json file>>
pulumi config set aws:region us-east-1
pulumi up --stack <<stack name as per your json file>>

Example:
pulumi stack init automation-triggers-prod-feeder-lambda
pulumi stack select automation-triggers-prod-feeder-lambda
pulumi config set aws:region us-east-1
pulumi up --stack automation-triggers-prod-feeder-lambda --yes
pulumi destroy --stack automation-triggers-prod-feeder-lambda --yes
Took 5m13s

pulumi stack init automation-triggers-prod-orchestrator-lambda
pulumi stack select automation-triggers-prod-orchestrator-lambda
pulumi config set aws:region us-east-1
pulumi up --stack automation-triggers-prod-orchestrator-lambda --yes
pulumi destroy --stack automation-triggers-prod-orchestrator-lambda --yes
Took 3m38s

pulumi stack init automation-triggers-prod-reservation-processor-lambda
pulumi stack select automation-triggers-prod-reservation-processor-lambda
pulumi config set aws:region us-east-1
pulumi up --stack automation-triggers-prod-reservation-processor-lambda --yes
pulumi destroy --stack automation-triggers-prod-reservation-processor-lambda --yes

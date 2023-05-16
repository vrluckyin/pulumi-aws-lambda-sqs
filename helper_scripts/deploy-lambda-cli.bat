echo %time%
call aws lambda update-function-code --publish --query "[Version][0]" --region us-east-1 --function-name  stage-vipul-automation_feeder-lambda1 --s3-bucket lynx-bitbucket-codedeploy --s3-key automation-feeder-lambda.zip
call aws lambda update-alias --region us-east-1 --function-name stage-vipul-automation_feeder-lambda1 --name Stage --function-version $LATEST --description "Latest"

call aws lambda update-function-code --publish --query "[Version][0]" --region us-east-1 --function-name  stage-vipul-automation_feeder-lambda2 --s3-bucket lynx-bitbucket-codedeploy --s3-key automation-feeder-lambda.zip
call aws lambda update-alias --region us-east-1 --function-name stage-vipul-automation_feeder-lambda2 --name Stage --function-version $LATEST --description "Latest"

call aws lambda update-function-code --publish --query "[Version][0]" --region us-east-1 --function-name  stage-vipul-automation_feeder-lambda3 --s3-bucket lynx-bitbucket-codedeploy --s3-key automation-feeder-lambda.zip
call aws lambda update-alias --region us-east-1 --function-name stage-vipul-automation_feeder-lambda3 --name Stage --function-version $LATEST --description "Latest"

call aws lambda update-function-code --publish --query "[Version][0]" --region us-east-1 --function-name  stage-vipul-automation_feeder-lambda4 --s3-bucket lynx-bitbucket-codedeploy --s3-key automation-feeder-lambda.zip
call aws lambda update-alias --region us-east-1 --function-name stage-vipul-automation_feeder-lambda4 --name Stage --function-version $LATEST --description "Latest"

call aws lambda update-function-code --publish --query "[Version][0]" --region us-east-1 --function-name  stage-vipul-automation_feeder-lambda5 --s3-bucket lynx-bitbucket-codedeploy --s3-key automation-feeder-lambda.zip
call aws lambda update-alias --region us-east-1 --function-name stage-vipul-automation_feeder-lambda5 --name Stage --function-version $LATEST --description "Latest"
echo %time%
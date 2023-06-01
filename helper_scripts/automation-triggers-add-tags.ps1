$lambdas = @(
  "dev_process_schlage_lambda"
)

Foreach ($lambda in $lambdas) {

  Write-Host $lambda "----------`n"
  $arn = "arn:aws:lambda:us-east-1:988343836093:function:${lambda}"
  if ($tag.length -gt 0) {
    $arn = "${arn}:${tag}"
  }

  $tag = "test-tag"
  $tagValue = "tag"
  
  $cmd = "aws lambda tag-resource --region us-east-1 --resource ${arn} --tags ""${tag}=${tagValue}"""
  Write-Host ">>>> ${cmd} `n"
  aws lambda tag-resource --region us-east-1 --resource ${arn} --tags "${tag}=${tagValue}"
  
}
$lambdas = @(
  "prod-automation_feeder-default-processor-high_priority"
  "prod-automation_feeder-default-processor-medium_priority"
  "prod-automation_feeder-default-processor-low_priority"
  "prod-automation_feeder-lambda"
  "prod-automation_feeder-streamline-lambda"
  "prod-automation_feeder-cloudbeds-lambda"
  "prod-automation_feeder-stayntouch-lambda"
  "prod-automation_feeder-rns-lambda"
  "prod-automation_feeder-booking_automation-lambda"
  "prod-automation_feeder-lodgify-lambda"
  "prod-automation_feeder-hostfully-lambda"
  "prod-automation_feeder-guesty-lambda"
  "prod-automation_feeder-clock-lambda"
  "prod-automation_feeder-mews-lambda"
  "prod-automation_feeder-rdp-lambda"
  "prod-automation_feeder-direct-lambda"
  "prod-automation_feeder-fantastic-lambda"
  "prod-automation_feeder-vrm-lambda"
  "prod-automation_feeder-myvr-lambda"
  "prod-automation_feeder-igms-lambda"
  "prod-automation_feeder-ciirus-lambda"
  "prod-automation_feeder-escapia-lambda"
  "prod-automation_feeder-ownerrez-lambda"
  "prod-automation_feeder-hostaway-lambda"
  "prod-automation_feeder-lynx_api-lambda"
  "prod-automation_feeder-lynx_ui-lambda"
  "prod-automation_feeder-automation_api-lambda"
  "prod-automation_feeder_property-lambda"
  "prod-automation_feeder-realtime-lambda"
  "prod-automation_feeder-guest_app-realtime-lambda"
  "prod-automation_feeder-secondary_groups-lambda"
  "prod-automation_feeder-processor-high_priority"
  "prod-automation_feeder-processor-medium_priority"
  "prod-automation_feeder-processor-low_priority"
  "prod-automation_feeder-group-processor-high_priority"
  "prod-automation_feeder-group-processor-medium_priority"
  "prod-automation_feeder-group-processor-low_priority"
  "prod-automation_feeder-streamline-processor-high_priority"
  "prod-automation_feeder-cloudbeds-processor-high_priority"
  "prod-automation_feeder-stayntouch-processor-high_priority"
  "prod-automation_feeder-ba-processor-high_priority"
  "prod-automation_feeder-lodgify-processor-high_priority"
  "prod-automation_feeder-hostfully-processor-high_priority"
  "prod-automation_feeder-guesty-processor-high_priority"
  "prod-automation_feeder-clock-processor-high_priority"
  "prod-automation_feeder-mews-processor-high_priority"
  "prod-automation_feeder-rdp-processor-high_priority"
  "prod-automation_feeder-direct-processor-high_priority"
  "prod-automation_feeder-fantastic-processor-high_priority"
  "prod-automation_feeder-vrm-processor-high_priority"
  "prod-automation_feeder-myvr-processor-high_priority"
  "prod-automation_feeder-igms-processor-high_priority"
  "prod-automation_feeder-ciirus-processor-high_priority"
  "prod-automation_feeder-escapia-processor-high_priority"
  "prod-automation_feeder-ownerrez-processor-high_priority"
  "prod-automation_feeder-hostaway-processor-high_priority"
  "prod-automation_feeder-streamline-processor-medium_priority"
  "prod-automation_feeder-cloudbeds-processor-medium_priority"
  "prod-automation_feeder-stayntouch-processor-medium_priority"
  "prod-automation_feeder-ba-processor-medium_priority"
  "prod-automation_feeder-lodgify-processor-medium_priority"
  "prod-automation_feeder-hostfully-processor-medium_priority"
  "prod-automation_feeder-guesty-processor-medium_priority"
  "prod-automation_feeder-clock-processor-medium_priority"
  "prod-automation_feeder-mews-processor-medium_priority"
  "prod-automation_feeder-rdp-processor-medium_priority"
  "prod-automation_feeder-direct-processor-medium_priority"
  "prod-automation_feeder-fantastic-processor-medium_priority"
  "prod-automation_feeder-vrm-processor-medium_priority"
  "prod-automation_feeder-myvr-processor-medium_priority"
  "prod-automation_feeder-igms-processor-medium_priority"
  "prod-automation_feeder-ciirus-processor-medium_priority"
  "prod-automation_feeder-escapia-processor-medium_priority"
  "prod-automation_feeder-ownerrez-processor-medium_priority"
  "prod-automation_feeder-hostaway-processor-medium_priority"
  "prod-automation_feeder-streamline-processor-low_priority"
  "prod-automation_feeder-cloudbeds-processor-low_priority"
  "prod-automation_feeder-stayntouch-processor-low_priority"
  "prod-automation_feeder-ba-processor-low_priority"
  "prod-automation_feeder-lodgify-processor-low_priority"
  "prod-automation_feeder-hostfully-processor-low_priority"
  "prod-automation_feeder-guesty-processor-low_priority"
  "prod-automation_feeder-clock-processor-low_priority"
  "prod-automation_feeder-mews-processor-low_priority"
  "prod-automation_feeder-rdp-processor-low_priority"
  "prod-automation_feeder-direct-processor-low_priority"
  "prod-automation_feeder-fantastic-processor-low_priority"
  "prod-automation_feeder-vrm-processor-low_priority"
  "prod-automation_feeder-myvr-processor-low_priority"
  "prod-automation_feeder-igms-processor-low_priority"
  "prod-automation_feeder-ciirus-processor-low_priority"
  "prod-automation_feeder-escapia-processor-low_priority"
  "prod-automation_feeder-ownerrez-processor-low_priority"
  "prod-automation_feeder-hostaway-processor-low_priority"
  "prod-automation_feeder-php-lambda"
  "prod-automation_feeder-escapia-php-lambda"
  "prod-automation_feeder-ciirus-php-lambda"
  "prod-automation_feeder-airbnb-php-lambda"
  "prod-automation_feeder-vreasy-php-lambda"
  "prod-automation_feeder-igms-php-lambda"
  "prod-automation_feeder-homeaway-php-lambda"
  "prod-automation_feeder-vrbo-php-lambda"
  "prod-automation_feeder-ownerrez-php-lambda"
  "prod-automation_feeder-hostaway-php-lambda"
  "prod-automation_feeder-hospitable-php-lambda"
  "prod-automation_feeder-uplisting-php-lambda"
  "prod-automation-orchestrator-lambda"
  "prod-arrival_instruction-orchestrator-lambda"
  "prod-booking_confirmation-orchestrator-lambda"
  "prod-request_review-orchestrator-lambda"
  "prod-guidebook-orchestrator-lambda"
  "prod-offer_stay_extension-orchestrator-lambda"
  "prod-checkout-orchestrator-lambda"
  "prod-others-orchestrator-lambda"
  "prod-arrival_instruction-automation"
  "prod-booking_confirmation-automation"
  "prod-request_review-automation"
  "prod-guidebook-automation"
  "prod-offer_stay_extension-automation"
  "prod-checkout-automation"
  "prod-others-automation"
)

#$keepLastVersions = 3
$removeOldVersions = 1
$isDebug = $true

Foreach ($lambda in $lambdas) {

  Write-Host $lambda "----------`n"
  $arn = "arn:aws:lambda:us-east-1:988343836093:function:${lambda}"
  if ($tag.length -gt 0) {
    $arn = "${arn}:${tag}"
  }
  
  $cmd = "aws lambda list-versions-by-function --region us-east-1  --function-name ${lambda} --query 'Versions[].Version'"
  Write-Host ">>>> ${cmd} `n"
  $versions = aws lambda list-versions-by-function --region us-east-1  --function-name ${lambda} --query 'Versions[].Version' | ConvertFrom-Json
  $versions
  $versionsInt = New-Object System.Collections.Generic.List[int]

  if($isDebug -eq $false)
  {
    foreach($version in $versions)
    {
      if($version -eq '$LATEST')
      {
        continue;
      }
      $versionsInt.Add([int]$version);
    }

    $toBeDeletedVersions = If ($versionsInt.Count -gt $removeOldVersions+2) {$removeOldVersions} Else { if ($removeOldVersions -gt $versionsInt.Count) {1} else {0}}

    if ($toBeDeletedVersions -gt 0 -and $versionsInt.Count -gt 2)
    {
      $versionsToBeDeleted = $versionsInt | Sort-Object -Descending | Select-Object -Last $toBeDeletedVersions

      $versionsToBeDeleted

      foreach($versionToBeDeleted in $versionsToBeDeleted)
      {
        $cmd = "aws lambda list-versions-by-function --region us-east-1  --function-name ${lambda} --qualifier ${versionToBeDeleted}"
        Write-Host ">>>> ${cmd} `n"

        aws lambda delete-function --region us-east-1  --function-name ${lambda} --qualifier ${versionToBeDeleted}
      }

      
    }
  }
  
}
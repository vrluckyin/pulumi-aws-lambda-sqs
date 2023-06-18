$lambdas = @(
  "stage-automation_feeder-default-processor-high_priority"
  "stage-automation_feeder-default-processor-medium_priority"
  "stage-automation_feeder-default-processor-low_priority"
  "stage-automation_feeder-lambda"
  "stage-automation_feeder-streamline-lambda"
  "stage-automation_feeder-cloudbeds-lambda"
  "stage-automation_feeder-stayntouch-lambda"
  "stage-automation_feeder-rns-lambda"
  "stage-automation_feeder-booking_automation-lambda"
  "stage-automation_feeder-lodgify-lambda"
  "stage-automation_feeder-hostfully-lambda"
  "stage-automation_feeder-guesty-lambda"
  "stage-automation_feeder-clock-lambda"
  "stage-automation_feeder-mews-lambda"
  "stage-automation_feeder-rdp-lambda"
  "stage-automation_feeder-direct-lambda"
  "stage-automation_feeder-fantastic-lambda"
  "stage-automation_feeder-vrm-lambda"
  "stage-automation_feeder-myvr-lambda"
  "stage-automation_feeder-igms-lambda"
  "stage-automation_feeder-ciirus-lambda"
  "stage-automation_feeder-escapia-lambda"
  "stage-automation_feeder-ownerrez-lambda"
  "stage-automation_feeder-hostaway-lambda"
  "stage-automation_feeder-lynx_api-lambda"
  "stage-automation_feeder-lynx_ui-lambda"
  "stage-automation_feeder-automation_api-lambda"
  "stage-automation_feeder_property-lambda"
  "stage-automation_feeder-realtime-lambda"
  "stage-automation_feeder-guest_app-realtime-lambda"
  "stage-automation_feeder-secondary_groups-lambda"
  "stage-automation_feeder-processor-high_priority"
  "stage-automation_feeder-processor-medium_priority"
  "stage-automation_feeder-processor-low_priority"
  "stage-automation_feeder-group-processor-high_priority"
  "stage-automation_feeder-group-processor-medium_priority"
  "stage-automation_feeder-group-processor-low_priority"
  "stage-automation_feeder-streamline-processor-high_priority"
  "stage-automation_feeder-cloudbeds-processor-high_priority"
  "stage-automation_feeder-stayntouch-processor-high_priority"
  "stage-automation_feeder-ba-processor-high_priority"
  "stage-automation_feeder-lodgify-processor-high_priority"
  "stage-automation_feeder-hostfully-processor-high_priority"
  "stage-automation_feeder-guesty-processor-high_priority"
  "stage-automation_feeder-clock-processor-high_priority"
  "stage-automation_feeder-mews-processor-high_priority"
  "stage-automation_feeder-rdp-processor-high_priority"
  "stage-automation_feeder-direct-processor-high_priority"
  "stage-automation_feeder-fantastic-processor-high_priority"
  "stage-automation_feeder-vrm-processor-high_priority"
  "stage-automation_feeder-myvr-processor-high_priority"
  "stage-automation_feeder-igms-processor-high_priority"
  "stage-automation_feeder-ciirus-processor-high_priority"
  "stage-automation_feeder-escapia-processor-high_priority"
  "stage-automation_feeder-ownerrez-processor-high_priority"
  "stage-automation_feeder-hostaway-processor-high_priority"
  "stage-automation_feeder-streamline-processor-medium_priority"
  "stage-automation_feeder-cloudbeds-processor-medium_priority"
  "stage-automation_feeder-stayntouch-processor-medium_priority"
  "stage-automation_feeder-ba-processor-medium_priority"
  "stage-automation_feeder-lodgify-processor-medium_priority"
  "stage-automation_feeder-hostfully-processor-medium_priority"
  "stage-automation_feeder-guesty-processor-medium_priority"
  "stage-automation_feeder-clock-processor-medium_priority"
  "stage-automation_feeder-mews-processor-medium_priority"
  "stage-automation_feeder-rdp-processor-medium_priority"
  "stage-automation_feeder-direct-processor-medium_priority"
  "stage-automation_feeder-fantastic-processor-medium_priority"
  "stage-automation_feeder-vrm-processor-medium_priority"
  "stage-automation_feeder-myvr-processor-medium_priority"
  "stage-automation_feeder-igms-processor-medium_priority"
  "stage-automation_feeder-ciirus-processor-medium_priority"
  "stage-automation_feeder-escapia-processor-medium_priority"
  "stage-automation_feeder-ownerrez-processor-medium_priority"
  "stage-automation_feeder-hostaway-processor-medium_priority"
  "stage-automation_feeder-streamline-processor-low_priority"
  "stage-automation_feeder-cloudbeds-processor-low_priority"
  "stage-automation_feeder-stayntouch-processor-low_priority"
  "stage-automation_feeder-ba-processor-low_priority"
  "stage-automation_feeder-lodgify-processor-low_priority"
  "stage-automation_feeder-hostfully-processor-low_priority"
  "stage-automation_feeder-guesty-processor-low_priority"
  "stage-automation_feeder-clock-processor-low_priority"
  "stage-automation_feeder-mews-processor-low_priority"
  "stage-automation_feeder-rdp-processor-low_priority"
  "stage-automation_feeder-direct-processor-low_priority"
  "stage-automation_feeder-fantastic-processor-low_priority"
  "stage-automation_feeder-vrm-processor-low_priority"
  "stage-automation_feeder-myvr-processor-low_priority"
  "stage-automation_feeder-igms-processor-low_priority"
  "stage-automation_feeder-ciirus-processor-low_priority"
  "stage-automation_feeder-escapia-processor-low_priority"
  "stage-automation_feeder-ownerrez-processor-low_priority"
  "stage-automation_feeder-hostaway-processor-low_priority"
  "stage-automation_feeder-php-lambda"
  "stage-automation_feeder-escapia-php-lambda"
  "stage-automation_feeder-ciirus-php-lambda"
  "stage-automation_feeder-airbnb-php-lambda"
  "stage-automation_feeder-vreasy-php-lambda"
  "stage-automation_feeder-igms-php-lambda"
  "stage-automation_feeder-homeaway-php-lambda"
  "stage-automation_feeder-vrbo-php-lambda"
  "stage-automation_feeder-ownerrez-php-lambda"
  "stage-automation_feeder-hostaway-php-lambda"
  "stage-automation_feeder-hospitable-php-lambda"
  "stage-automation_feeder-uplisting-php-lambda"
  "stage-automation-orchestrator-lambda"
  "stage-arrival_instruction-orchestrator-lambda"
  "stage-booking_confirmation-orchestrator-lambda"
  "stage-request_review-orchestrator-lambda"
  "stage-guidebook-orchestrator-lambda"
  "stage-offer_stay_extension-orchestrator-lambda"
  "stage-checkout-orchestrator-lambda"
  "stage-others-orchestrator-lambda"
  "stage-arrival_instruction-automation"
  "stage-booking_confirmation-automation"
  "stage-request_review-automation"
  "stage-guidebook-automation"
  "stage-offer_stay_extension-automation"
  "stage-checkout-automation"
  "stage-others-automation"
)

#$keepLastVersions = 3
$removeOldVersions = 5
$isDebug = $false

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
        $cmd = "aws lambda delete-function --region us-east-1  --function-name ${lambda} --qualifier ${versionToBeDeleted}"
        Write-Host ">>>> ${cmd} `n"

        aws lambda delete-function --region us-east-1  --function-name ${lambda} --qualifier ${versionToBeDeleted}
      }

      
    }
  }
  
}
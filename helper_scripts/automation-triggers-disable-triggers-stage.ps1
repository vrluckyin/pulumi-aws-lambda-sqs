$lambdas = @(
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
"stage-automation_feeder-default-processor-high_priority"
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
"stage-automation_feeder-default-processor-medium_priority"
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
"stage-automation_feeder-default-processor-low_priority"
"stage_delete_group_automation_lambda"
"stage-automation-orchestrator"
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

$tag = ''
#$tag = ''
$isDebugMode = $false
# For disable
$enabledDisabledState = 'Disabled'

#For Enable
#$enabledDisabledState = 'Enabled'

$enabledDisabledOption = '--enabled'

Foreach ($lambda in $lambdas) {

  Write-Host $lambda "----------`n"
  $arn = "arn:aws:lambda:us-east-1:988343836093:function:${lambda}"
  if ($tag.length -gt 0) {
    $arn = "${arn}:${tag}"
  }
  
  Write-Host $arn "----------`n"
 
  if ($isDebugMode) {
    Write-Host ">>>> list-event-source-mappings of ${lambda} `n"
    $list_event_source_mappings = "aws lambda list-event-source-mappings --region us-east-1 --function-name ${arn}"
    Write-Host $list_event_source_mappings "`n"
  }
  $mapping = aws lambda list-event-source-mappings --region us-east-1 --function-name ${arn} | ConvertFrom-Json
  Write-Host "EventSourceMappings----------`n"
  $mapping.EventSourceMappings

  Write-Host "----------`n"
  Foreach ($eventSourceMapping in $mapping.EventSourceMappings) {
    $uuid = $eventSourceMapping.UUID;
    $eventSourceArn = $eventSourceMapping.EventSourceArn;

    $eventSourceArnParths =$eventSourceArn.Split(":")
    $sqsUrl = $eventSourceArnParths[5]

    $get_event_attributes = "QQQQQ: aws sqs get-queue-attributes --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/${sqsUrl} --attribute-names VisibilityTimeout ApproximateNumberOfMessages ApproximateNumberOfMessagesNotVisible ApproximateNumberOfMessagesDelayed"
    Write-Host $get_event_attributes "`n"

    $state = $eventSourceMapping.State
    if ($isDebugMode) {
      Write-Host "UPDATE | ${eventSourceArn} from ${lambda} >>>>>>>>>>>>>>>> `n"
      $update_event_source_mapping = "aws lambda update-event-source-mapping --region us-east-1 ${enabledDisabledOption} --uuid ""${uuid}"""
      Write-Host $update_event_source_mapping "`n"
    }
    else {
      Write-Host $enabledDisabledState ">>>>>>" $state
      if ($enabledDisabledState -eq $state) {

      }
      else {
        if ($state -eq "Disabled") {
          $enabledDisabledOption = '--enabled'
        }
        else {
          if ($state -eq "Enabled") {
            $enabledDisabledOption = '--no-enabled'
          }
          else {
            $enabledDisabledOption = '';
          }
        }
        if ($enabledDisabledOption.length -gt 0) {
          Write-Host "Command output with ${enabledDisabledOption} `n"
          aws lambda update-event-source-mapping --region us-east-1 ${enabledDisabledOption} --uuid "${uuid}"
        }
      }
    
      Write-Host "----------`n"
    }
  }
}
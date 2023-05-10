$lambdas = @(
  'prod-messaging-scheduler-step1-lambda'
  'prod-messaging-scheduler-step2-lambda'
  'prod-messaging-scheduler-step3-lambda'
  'prod-messaging-scheduler-step4-lambda'
  'prod-messaging-scheduler-step5-lambda'
)

#$tag = 'Prod'
$tag = ''
$isDebugMode = $true
# For disable
#$enabledDisabledState = 'Disabled'

#For Enable
$enabledDisabledState = 'Enabled'

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
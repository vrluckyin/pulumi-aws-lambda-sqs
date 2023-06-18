echo "dlq1 queues"
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-arrival_instruction-automation-queue
echo 122
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-arrival_instruction-orchestrator-queue
echo 123
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-airbnb-php-queue.fifo
echo 124
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-automation_api-queue.fifo
echo 125
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ba-reservation_processor-high_priority-queue
echo 126
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ba-reservation_processor-medium_priority-queue
echo 127
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-booking_automation-processor-low_priority-queue
echo 128
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-booking_automation-queue.fifo
echo 129
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ciirus-php-queue.fifo
echo 130
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ciirus-queue.fifo
echo 131
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ciirus-reservation_processor-high_priority-queue
echo 132
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ciirus-reservation_processor-low_priority-queue
echo 133
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ciirus-reservation_processor-medium_priority-queue
echo 134
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-clock-queue.fifo
echo 135
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-clock-reservation_processor-high_priority-queue
echo 136
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-clock-reservation_processor-low_priority-queue
echo 137
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-clock-reservation_processor-medium_priority-queue
echo 138
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-cloudbeds-queue.fifo
echo 139
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-cloudbeds-reservation_processor-high_priority-queue
echo 140
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-cloudbeds-reservation_processor-low_priority-queue
echo 141
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-cloudbeds_processor-medium_priority-queue
echo 142
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-default-reservation_processor-high_priority-queue
echo 143
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-default-reservation_processor-low_priority-queue
echo 144
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-default-reservation_processor-medium_priority-queue
echo 145
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-direct-queue.fifo
echo 146
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-direct-reservation_processor-high_priority-queue
echo 147
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-direct-reservation_processor-low_priority-queue
echo 148
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-direct-reservation_processor-medium_priority-queue
echo 149
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-escapia-php-queue.fifo
echo 150
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-escapia-queue.fifo
echo 151
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-escapia-reservation_processor-high_priority-queue
echo 152
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-escapia-reservation_processor-low_priority-queue
echo 153
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-escapia-reservation_processor-medium_priority-queue
echo 154
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-fantastic-queue.fifo
echo 155
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-fantastic-reservation_processor-high_priority-queue
echo 156
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-fantastic-reservation_processor-low_priority-queue
echo 157
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-fantastic_processor-medium_priority-queue
echo 158
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-group-reservation_processor-high_priority-queue
echo 159
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-group-reservation_processor-low_priority-queue
echo 160
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-group-reservation_processor-medium_priority-queue
echo 161
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-guesty-queue.fifo
echo 162
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-guesty-reservation_processor-high_priority-queue
echo 163
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-guesty-reservation_processor-low_priority-queue
echo 164
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-guesty-reservation_processor-medium_priority-queue
echo 165
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-guest_app-realtime-queue.fifo
echo 166
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-homeaway-php-queue.fifo
echo 167
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hospitable-php-queue.fifo
echo 168
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostaway-php-queue.fifo
echo 169
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostaway-queue.fifo
echo 170
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostaway-reservation_processor-high_priority-queue
echo 171
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostaway-reservation_processor-low_priority-queue
echo 172
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostaway-reservation_processor-medium_priority-queue
echo 173
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostfully-queue.fifo
echo 174
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostfully-reservation_processor-high_priority-queue
echo 175
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostfully-reservation_processor-low_priority-queue
echo 176
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-hostfully_processor-medium_priority-queue
echo 177
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-igms-php-queue.fifo
echo 178
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-igms-queue.fifo
echo 179
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-igms-reservation_processor-high_priority-queue
echo 180
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-igms-reservation_processor-low_priority-queue
echo 181
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-igms-reservation_processor-medium_priority-queue
echo 182
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lodgify-queue.fifo
echo 183
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lodgify-reservation_processor-high_priority-queue
echo 184
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lodgify-reservation_processor-low_priority-queue
echo 185
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lodgify-reservation_processor-medium_priority-queue
echo 186
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lynx_api-queue.fifo
echo 187
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-lynx_ui-queue.fifo
echo 188
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-mews-queue.fifo
echo 189
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-mews-reservation_processor-high_priority-queue
echo 190
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-mews-reservation_processor-low_priority-queue
echo 191
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-mews-reservation_processor-medium_priority-queue
echo 192
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-myvr-queue.fifo
echo 193
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-myvr-reservation_processor-high_priority-queue
echo 194
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-myvr-reservation_processor-low_priority-queue
echo 195
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-myvr-reservation_processor-medium_priority-queue
echo 196
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ownerrez-php-queue.fifo
echo 197
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ownerrez-queue.fifo
echo 198
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ownerrez-reservation_processor-high_priority-queue
echo 199
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ownerrez-reservation_processor-low_priority-queue
echo 200
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-ownerrez-reservation_processor-medium_priority-queue
echo 201
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-php-queue.fifo
echo 202
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-queue.fifo
echo 203
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-rdp-queue.fifo
echo 204
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-rdp-reservation_processor-high_priority-queue
echo 205
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-rdp-reservation_processor-low_priority-queue
echo 206
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-rdp-reservation_processor-medium_priority-queue
echo 207
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-realtime-queue.fifo
echo 208
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-reservation_processor-high_priority-queue
echo 209
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-reservation_processor-low_priority-queue
echo 210
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-reservation_processor-medium_priority-queue
echo 211
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-rns-queue.fifo
echo 212
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-secondary_groups-queue.fifo
echo 213
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-stayntouch-queue.fifo
echo 214
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-stayntouch-reservation_processor-high_priority-queue
echo 215
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-stayntouch-reservation_processor-low_priority-queue
echo 216
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-stayntouch_processor-medium_priority-queue
echo 217
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-streamline-queue.fifo
echo 218
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-streamline-reservation_processor-high_priority-queue
echo 219
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-streamline-reservation_processor-low_priority-queue
echo 220
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-streamline_processor-medium_priority-queue
echo 221
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-uplisting-php-queue.fifo
echo 222
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vrbo-php-queue.fifo
echo 223
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vreasy-php-queue.fifo
echo 224
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vrm-queue.fifo
echo 225
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vrm-reservation_processor-high_priority-queue
echo 226
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vrm-reservation_processor-low_priority-queue
echo 227
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder-vrm-reservation_processor-medium_priority-queue
echo 228
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_feeder_property-queue
echo 229
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-automation_orchestrator-queue
echo 230
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-booking_confirmation-automation-queue
echo 231
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-booking_confirmation-orchestrator-queue
echo 232
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-checkout-automation-queue
echo 233
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-checkout-orchestrator-queue
echo 234
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-guidebook-automation-queue
echo 235
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-guidebook-orchestrator-queue
echo 236
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-offer_stay_extension-automation-queue
echo 237
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-offer_stay_extension-orchestrator-queue
echo 238
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-others-automation-queue
echo 239
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-others-orchestrator-queue
echo 240
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-request_review-automation-queue
echo 241
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq1-request_review-orchestrator-queue
echo 242
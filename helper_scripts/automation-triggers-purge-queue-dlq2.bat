echo "dlq2 queues"
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-arrival_instruction-automation-queue
echo 243
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-arrival_instruction-orchestrator-queue
echo 244
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-airbnb-php-queue.fifo
echo 245
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-automation_api-queue.fifo
echo 246
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ba-reservation_processor-high_priority-queue
echo 247
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ba-reservation_processor-medium_priority-queue
echo 248
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-booking_automation-processor-low_priority-queue
echo 249
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-booking_automation-queue.fifo
echo 250
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ciirus-php-queue.fifo
echo 251
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ciirus-queue.fifo
echo 252
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ciirus-reservation_processor-high_priority-queue
echo 253
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ciirus-reservation_processor-low_priority-queue
echo 254
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ciirus-reservation_processor-medium_priority-queue
echo 255
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-clock-queue.fifo
echo 256
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-clock-reservation_processor-high_priority-queue
echo 257
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-clock-reservation_processor-low_priority-queue
echo 258
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-clock-reservation_processor-medium_priority-queue
echo 259
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-cloudbeds-queue.fifo
echo 260
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-cloudbeds-reservation_processor-high_priority-queue
echo 261
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-cloudbeds-reservation_processor-low_priority-queue
echo 262
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-cloudbeds_processor-medium_priority-queue
echo 263
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-default-reservation_processor-high_priority-queue
echo 264
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-default-reservation_processor-low_priority-queue
echo 265
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-default-reservation_processor-medium_priority-queue
echo 266
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-direct-queue.fifo
echo 267
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-direct-reservation_processor-high_priority-queue
echo 268
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-direct-reservation_processor-low_priority-queue
echo 269
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-direct-reservation_processor-medium_priority-queue
echo 270
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-escapia-php-queue.fifo
echo 271
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-escapia-queue.fifo
echo 272
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-escapia-reservation_processor-high_priority-queue
echo 273
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-escapia-reservation_processor-low_priority-queue
echo 274
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-escapia-reservation_processor-medium_priority-queue
echo 275
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-fantastic-queue.fifo
echo 276
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-fantastic-reservation_processor-high_priority-queue
echo 277
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-fantastic-reservation_processor-low_priority-queue
echo 278
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-fantastic_processor-medium_priority-queue
echo 279
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-group-reservation_processor-high_priority-queue
echo 280
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-group-reservation_processor-low_priority-queue
echo 281
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-group-reservation_processor-medium_priority-queue
echo 282
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-guesty-queue.fifo
echo 283
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-guesty-reservation_processor-high_priority-queue
echo 284
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-guesty-reservation_processor-low_priority-queue
echo 285
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-guesty-reservation_processor-medium_priority-queue
echo 286
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-guest_app-realtime-queue.fifo
echo 287
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-homeaway-php-queue.fifo
echo 288
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hospitable-php-queue.fifo
echo 289
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostaway-php-queue.fifo
echo 290
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostaway-queue.fifo
echo 291
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostaway-reservation_processor-high_priority-queue
echo 292
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostaway-reservation_processor-low_priority-queue
echo 293
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostaway-reservation_processor-medium_priority-queue
echo 294
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostfully-queue.fifo
echo 295
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostfully-reservation_processor-high_priority-queue
echo 296
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostfully-reservation_processor-low_priority-queue
echo 297
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-hostfully_processor-medium_priority-queue
echo 298
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-igms-php-queue.fifo
echo 299
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-igms-queue.fifo
echo 300
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-igms-reservation_processor-high_priority-queue
echo 301
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-igms-reservation_processor-low_priority-queue
echo 302
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-igms-reservation_processor-medium_priority-queue
echo 303
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lodgify-queue.fifo
echo 304
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lodgify-reservation_processor-high_priority-queue
echo 305
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lodgify-reservation_processor-low_priority-queue
echo 306
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lodgify-reservation_processor-medium_priority-queue
echo 307
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lynx_api-queue.fifo
echo 308
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-lynx_ui-queue.fifo
echo 309
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-mews-queue.fifo
echo 310
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-mews-reservation_processor-high_priority-queue
echo 311
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-mews-reservation_processor-low_priority-queue
echo 312
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-mews-reservation_processor-medium_priority-queue
echo 313
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-myvr-queue.fifo
echo 314
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-myvr-reservation_processor-high_priority-queue
echo 315
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-myvr-reservation_processor-low_priority-queue
echo 316
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-myvr-reservation_processor-medium_priority-queue
echo 317
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ownerrez-php-queue.fifo
echo 318
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ownerrez-queue.fifo
echo 319
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ownerrez-reservation_processor-high_priority-queue
echo 320
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ownerrez-reservation_processor-low_priority-queue
echo 321
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-ownerrez-reservation_processor-medium_priority-queue
echo 322
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-php-queue.fifo
echo 323
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-queue.fifo
echo 324
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-rdp-queue.fifo
echo 325
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-rdp-reservation_processor-high_priority-queue
echo 326
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-rdp-reservation_processor-low_priority-queue
echo 327
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-rdp-reservation_processor-medium_priority-queue
echo 328
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-realtime-queue.fifo
echo 329
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-reservation_processor-high_priority-queue
echo 330
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-reservation_processor-low_priority-queue
echo 331
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-reservation_processor-medium_priority-queue
echo 332
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-rns-queue.fifo
echo 333
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-secondary_groups-queue.fifo
echo 334
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-stayntouch-queue.fifo
echo 335
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-stayntouch-reservation_processor-high_priority-queue
echo 336
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-stayntouch-reservation_processor-low_priority-queue
echo 337
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-stayntouch_processor-medium_priority-queue
echo 338
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-streamline-queue.fifo
echo 339
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-streamline-reservation_processor-high_priority-queue
echo 340
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-streamline-reservation_processor-low_priority-queue
echo 341
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-streamline_processor-medium_priority-queue
echo 342
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-uplisting-php-queue.fifo
echo 343
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vrbo-php-queue.fifo
echo 344
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vreasy-php-queue.fifo
echo 345
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vrm-queue.fifo
echo 346
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vrm-reservation_processor-high_priority-queue
echo 347
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vrm-reservation_processor-low_priority-queue
echo 348
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder-vrm-reservation_processor-medium_priority-queue
echo 349
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_feeder_property-queue
echo 350
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-automation_orchestrator-queue
echo 351
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-booking_confirmation-automation-queue
echo 352
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-booking_confirmation-orchestrator-queue
echo 353
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-checkout-automation-queue
echo 354
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-checkout-orchestrator-queue
echo 355
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-guidebook-automation-queue
echo 356
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-guidebook-orchestrator-queue
echo 357
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-offer_stay_extension-automation-queue
echo 358
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-offer_stay_extension-orchestrator-queue
echo 359
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-others-automation-queue
echo 360
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-others-orchestrator-queue
echo 361
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-request_review-automation-queue
echo 362
call aws sqs purge-queue --region us-east-1 --queue-url https://sqs.us-east-1.amazonaws.com/988343836093/prod-dlq2-request_review-orchestrator-queue
echo 363

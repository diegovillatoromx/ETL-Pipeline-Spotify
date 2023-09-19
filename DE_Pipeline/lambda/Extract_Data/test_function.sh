#!/bin/bash

# Set your Lambda function name
FUNCTION_NAME="extract_data"

# Define the name for the test event
TEST_EVENT_NAME="test-lambda"

# Define the JSON payload
PAYLOAD='{
  "key1": "value1",
  "key2": "value2",
  "key3": "value3"
}'

# Configure the test event
aws lambda create-event-source-mapping \
  --function-name "$FUNCTION_NAME" \
  --name "$TEST_EVENT_NAME" \
  --event-source-arn "arn_del_evento_de_prueba" \
  --batch-size 1 \
  --starting-position LATEST \
  --maximum-batching-window-in-seconds 5 \
  --event-source "$PAYLOAD"

# Invoke the Lambda function and store the response in output.txt
aws lambda invoke --function-name "$FUNCTION_NAME" --cli-binary-format raw-in-base64-out --payload "$PAYLOAD" output.txt

# Check the response status code
if [ $? -eq 0 ]; then
  echo "Test event executed successfully."
else
  echo "Error executing the test event."
fi


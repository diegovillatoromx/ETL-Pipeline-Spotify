#!/bin/bash

# Variables
aws_region=  # Your AWS region
aws_account_id= # Your AWS account ID
function_name="data_extract"  # Name of your Lambda function
rule_name="every_minute"  # Name of the rule in EventBridge
rule_arn="arn:aws:events:$aws_region:$aws_account_id:rule/$rule_name"  # ARN of your rule

# Associate the EventBridge rule with the Lambda function
aws lambda add-permission \
  --function-name "$function_name" \
  --statement-id "event-rule-$rule_name" \
  --action "lambda:InvokeFunction" \
  --principal "events.amazonaws.com" \
  --source-arn "$rule_arn"

# Add the EventBridge rule to the Lambda function as a target
aws events put-targets \
  --rule "$rule_name" \
  --targets "Id"="1","Arn"="arn:aws:lambda:$aws_region:$aws_account_id:function:$function_name"

echo "EventBridge rule '$rule_name' has been successfully associated with Lambda function '$function_name'."

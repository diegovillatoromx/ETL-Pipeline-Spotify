#!/bin/bash

# Variables
aws_region= # Your AWS region
aws_account_id=  # Your AWS account ID
rule_name="every_minute"  # Name of the rule in EventBridge
lambda_arn="arn:aws:lambda:$aws_region:$aws_account_id:function:data_extract"  # ARN of the Lambda function

# Create the rule in EventBridge
aws events put-rule --name "$rule_name" --schedule-expression "rate(1 minute)"

# Create a target for the rule pointing to the Lambda function with an empty JSON input
aws events put-targets --rule "$rule_name" --targets "Id=1,Arn=$lambda_arn,Input='{}'" --output text

echo "EventBridge rule successfully created: $rule_name"

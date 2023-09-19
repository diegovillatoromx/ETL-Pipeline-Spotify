#!/bin/bash

# Variables
function_name="extract_data"  # Lambda function name
runtime="python3.8"  # Python version
custom_role_name="lambda_extract_role"  # Custom IAM role name
zip_file="lambda_function.zip"
account_id= # Your AWS ACCOUNT ID

# Compress the Python file into a ZIP archive
python_file_path="lambda_function.py"
zip -r "$zip_file" "$python_file_path"

# Step 1: Create the Lambda function
aws lambda create-function \
  --function-name "$function_name" \
  --runtime "$runtime" \
  --role "arn:aws:iam::$account_id:role/$custom_role_name" \
  --handler "lambda_function.lambda_handler" \
  --timeout 90 \
  --zip-file "fileb://$zip_file"

# Check the result of function creation
if [ $? -eq 0 ]; then
  echo "Lambda function '$function_name' created successfully."
else
  echo "Failed to create Lambda function."
fi

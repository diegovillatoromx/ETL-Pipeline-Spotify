#!/bin/bash

# Variables
function_name="transformation_function"  # Lambda function name
runtime="python3.8"  # Python version
custom_role_name="lambda_extract_role"  # Custom IAM role name
zip_file="load_transform.zip"
account_id= #Your AWS ACCOUNT ID
architecture="x86_64"  # Layer architecture

# Path to the Python file you want to compress
python_file_path="load_transform.py"

# Compress the Python file into a ZIP archive
zip -r "$zip_file" "$python_file_path"

# Step 1: Create the Lambda function
aws lambda create-function \
  --function-name "$function_name" \
  --runtime "$runtime" \
  --role "arn:aws:iam::$account_id:role/$custom_role_name" \
  --handler "load_transform.lambda_handler" \
  --timeout 90 \
  --architecture "$architecture" \
  --zip-file "fileb://$zip_file"

# Check the result of function and role creation
if [ $? -eq 0 ]; then
  echo "Lambda function '$function_name' created successfully."
  echo "Role '$custom_role_name' assigned successfully."
else
  echo "Failed to create Lambda function or assign role."
fi

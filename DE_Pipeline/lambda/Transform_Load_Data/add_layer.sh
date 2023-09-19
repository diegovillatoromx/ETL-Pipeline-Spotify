# Variables
aws_region= #Your AWS region
aws_account_id=  # Your AWS account ID
function_name="transformation_function"  # Your Lambda function name
layer_arn="arn:aws:lambda:$aws_region:$aws_account_id:layer:AWSSDKPandas-Python38:9"  # ARN of the Pandas layer

# Associate the layer with the Lambda function
aws lambda update-function-configuration \
  --function-name "$function_name" \
  --layers "$layer_arn"

# Check if the association was successful
if [ $? -eq 0 ]; then
  echo "Layer added successfully to Lambda function '$function_name'."
else
  echo "Error adding the layer to Lambda function '$function_name'."
fi

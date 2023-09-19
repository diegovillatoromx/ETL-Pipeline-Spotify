#!/bin/bash

# Modify these values according to your configuration
FUNCTION_NAME="extract_data"
CLIENT_ID= #client id api spotify
CLIENT_SECRET= #client secret api spotify

# Create environment variables
aws lambda update-function-configuration --function-name $FUNCTION_NAME \
    --environment "Variables={client_id=$CLIENT_ID,client_secret=$CLIENT_SECRET}"

echo "Environment variables have been created for the Lambda function $FUNCTION_NAME."

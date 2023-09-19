#!/bin/bash

# Modify these values according to your configuration
FUNCTION_NAME="extract_data"
LAYER_NAME="library_spotipy"
REGION="us-east-1"

# Get the Layer ARN
LAYER_ARN=$(aws lambda list-layers --region $REGION --query "Layers[?LayerName=='$LAYER_NAME'].LatestMatchingVersion.LayerVersionArn" --output text)

if [ -z "$LAYER_ARN" ]; then
  echo "Could not find the $LAYER_NAME layer in the $REGION region."
  exit 1
fi

# Connect the layer to the Lambda function
aws lambda update-function-configuration --function-name $FUNCTION_NAME \
    --layers $LAYER_ARN \
    --region $REGION

echo "The $LAYER_NAME layer has been connected to the $FUNCTION_NAME Lambda function in the $REGION region."

#!/bin/bash

# Layer name
layer_name="library_spotipy"

# Local path to the Spotipy library ZIP file
zip_file="spotipy_layer.zip"

# Compatible runtime
runtime="python3.8"

# Compatible architectures
architectures="x86_64"

# Create the layer without specifying a version
layer_arn=$(aws lambda publish-layer-version \
  --layer-name "$layer_name" \
  --description "Spotipy Library" \
  --compatible-runtimes "$runtime" \
  --compatible-architectures "$architectures" \
  --zip-file "fileb://$zip_file" \
  --output text \
  --query 'LayerVersionArn')

if [ $? -eq 0 ]; then
  echo "Layer created successfully. Layer ARN: $layer_arn"
else
  echo "Error creating the layer."
  exit 1
fi

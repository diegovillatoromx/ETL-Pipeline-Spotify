#!/bin/bash

# Bucket name
bucket_name="spotify-pipeline"

# Create the bucket
aws s3 mb s3://$bucket_name

# Define folder structure
folders=("raw_data" "processed_data")
subfolders=("processed" "to_processed")
subfolders2=("album_data" "artist_data" "songs_data")

# Create folders and subfolders
for folder in "${folders[@]}"; do
  aws s3api put-object --bucket $bucket_name --key "$folder/"
  if [ "$folder" == "raw_data" ]; then
    for subfolder in "${subfolders[@]}"; do
      aws s3api put-object --bucket $bucket_name --key "$folder/$subfolder/"
    done
  elif [ "$folder" == "processed_data" ]; then
    for subfolder in "${subfolders2[@]}"; do
      aws s3api put-object --bucket $bucket_name --key "$folder/$subfolder/"
    done
  fi
done

# Print a message indicating successful creation
echo "Folder structure in '$bucket_name' created successfully."


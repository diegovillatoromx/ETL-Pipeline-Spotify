#!/bin/bash

# User and group names
USERNAME="ETL-Pipeline-Spotify"
GROUPNAME="developer"

# Policies you want to attach to the group
POLICIES=(
  "AmazonS3FullAccess"
  "CloudWatchFullAccess"
  "AWSLambda_FullAccess"
  "AWSGlueConsoleFullAccess"
  "AmazonAthenaFullAccess"
  "AWSBillingConductorFullAccess"
)

# Create the group and attach policies
aws iam create-group --group-name $GROUPNAME

for POLICY in "${POLICIES[@]}"
do
  aws iam attach-group-policy --group-name $GROUPNAME --policy-arn arn:aws:iam::aws:policy/$POLICY
done

# Create the user and add them to the group
aws iam create-user --user-name $USERNAME
aws iam add-user-to-group --user-name $USERNAME --group-name $GROUPNAME

echo "Group $GROUPNAME created, and user $USERNAME added to the group successfully."

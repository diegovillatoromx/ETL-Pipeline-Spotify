#!/bin/bash

# IAM Role Name
role_name="lambda_role"

# Create IAM Role
aws iam create-role \
  --role-name "$role_name" \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }'

# Attach "AmazonS3FullAccess" policy to the role
aws iam attach-role-policy \
  --role-name "$role_name" \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess

# Create "InvokeLambdaFunctionPolicy" policy
aws iam create-policy \
  --policy-name "InvokeLambdaFunctionPolicy" \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "lambda:InvokeFunction",
        "Resource": "*"
      }
    ]
  }'

# Attach "InvokeLambdaFunctionPolicy" policy to the role
aws iam attach-role-policy \
  --role-name "$role_name" \
  --policy-arn arn:aws:iam::aws:policy/InvokeLambdaFunctionPolicy

echo "IAM Role '$role_name' created, and policies attached successfully."

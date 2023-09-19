# Define the role name
role_name="rol_crawler"

# Create the IAM role with the trust policy
aws iam create-role --role-name "$role_name" --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}'

# Attach the "AWSGlueServiceRole" policy to the role
aws iam attach-role-policy --role-name "$role_name" --policy-arn "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"

# Attach the "AmazonS3FullAccess" policy to the role
aws iam attach-role-policy --role-name "$role_name" --policy-arn "arn:aws:iam::aws:policy/AmazonS3FullAccess"

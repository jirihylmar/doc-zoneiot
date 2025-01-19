---
title: "AWS Permissions"
tags:
  - :system_document
---

# AWS Permissions

```yaml
Author: :team_jirihylmar
Created: 2025-01-18 16:44:13
Master: mkdocs
Contributors: :team_jirihylmar
Purpose:
- Management of AWS permissions based on user group
```

## Users

```
LuKa__vsb__299
MaLy__vsb__299
JaJa__vsb__299
MaTo__vsb__299
```

## Policies

Strategy where we maintain a balance between directly attached policies and a single consolidated custom policy.

Directly attach these critical AWS-managed policies:

1. AWSLambda_FullAccess (for serverless functions)
2. AmazonS3FullAccess (for storage)
3. AmazonDynamoDBFullAccess (for database)

Create a single custom policy for everything else. Let me write this comprehensive policy:

```bash
cat > zoneiot-complete-policy.json << 'EOL'
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "IoTCore",
            "Effect": "Allow",
            "Action": [
                "iot:*",
                "greengrass:*",
                "iotanalytics:*",
                "iotsitewise:*",
                "iotevents:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Messaging",
            "Effect": "Allow",
            "Action": [
                "sns:*",
                "sqs:*",
                "events:*",
                "eventbridge:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Monitoring",
            "Effect": "Allow",
            "Action": [
                "cloudwatch:*",
                "logs:*",
                "xray:*",
                "applicationinsights:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Development",
            "Effect": "Allow",
            "Action": [
                "cloudformation:*",
                "appsync:*",
                "amplify:*",
                "cognito-identity:*",
                "cognito-idp:*",
                "cognito-sync:*",
                "apigateway:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "AIServices",
            "Effect": "Allow",
            "Action": [
                "rekognition:*",
                "transcribe:*",
                "comprehend:*",
                "translate:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Orchestration",
            "Effect": "Allow",
            "Action": [
                "states:*",
                "stepfunctions:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "SelfServiceIAM",
            "Effect": "Allow",
            "Action": [
                "iam:ChangePassword",
                "iam:CreateAccessKey",
                "iam:CreateVirtualMFADevice",
                "iam:DeactivateMFADevice",
                "iam:DeleteAccessKey",
                "iam:DeleteVirtualMFADevice",
                "iam:EnableMFADevice",
                "iam:GetUser",
                "iam:ListAccessKeys",
                "iam:ListMFADevices",
                "iam:ListVirtualMFADevices",
                "iam:ResyncMFADevice",
                "iam:UpdateAccessKey",
                "iam:GetAccountPasswordPolicy",
                "iam:GetAccountSummary"
            ],
            "Resource": [
                "arn:aws:iam::*:user/${aws:username}",
                "arn:aws:iam::*:mfa/${aws:username}"
            ]
        }
    ]
}
EOL

# Implementation commands:
aws iam create-group --group-name zoneiot-users-group-299025166536 --profile JiHy__vsb__299

# Create the consolidated policy
aws iam create-policy \
    --policy-name zoneiot-complete-policy-299025166536 \
    --policy-document file://zoneiot-complete-policy.json \
    --profile JiHy__vsb__299

# Attach core managed policies
aws iam attach-group-policy --group-name zoneiot-users-group-299025166536 --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess --profile JiHy__vsb__299
aws iam attach-group-policy --group-name zoneiot-users-group-299025166536 --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --profile JiHy__vsb__299
aws iam attach-group-policy --group-name zoneiot-users-group-299025166536 --policy-arn arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess --profile JiHy__vsb__299

# Attach our custom consolidated policy
aws iam attach-group-policy \
    --group-name zoneiot-users-group-299025166536 \
    --policy-arn arn:aws:iam::299025166536:policy/zoneiot-complete-policy-299025166536 \
    --profile JiHy__vsb__299
```

This approach:
1. Keeps core data services (Lambda, S3, DynamoDB) as separate policies for clarity
2. Consolidates everything else into logical groups in one policy
3. Maintains self-service IAM capabilities
4. Stays well within the 10-policy limit
5. Groups related services together for better management

Check results

```bash
# Check if group exists
aws iam get-group --group-name zoneiot-users-group-299025166536 --profile JiHy__vsb__299

# List all attached policies
aws iam list-attached-group-policies --group-name zoneiot-users-group-299025166536 --profile JiHy__vsb__299

# Get the ARN of our custom policy
aws iam list-policies --scope Local --query 'Policies[?PolicyName==`zoneiot-complete-policy-299025166536`]' --profile JiHy__vsb__299

# Get the policy version details
aws iam get-policy-version --policy-arn arn:aws:iam::299025166536:policy/zoneiot-complete-policy-299025166536 --version-id v1 --profile JiHy__vsb__299
```

## Attach Users to Group

```bash
# Attach users to the group
aws iam add-user-to-group --group-name zoneiot-users-group-299025166536 --user-name LuKa__vsb__299 --profile JiHy__vsb__299
aws iam add-user-to-group --group-name zoneiot-users-group-299025166536 --user-name MaLy__vsb__299 --profile JiHy__vsb__299
aws iam add-user-to-group --group-name zoneiot-users-group-299025166536 --user-name JaJa__vsb__299 --profile JiHy__vsb__299
aws iam add-user-to-group --group-name zoneiot-users-group-299025166536 --user-name MaTo__vsb__299 --profile JiHy__vsb__299

# Verify users in group
aws iam get-group --group-name zoneiot-users-group-299025166536 --profile JiHy__vsb__299
```
#!/bin/bash -x
#
# Script to create AWS IAM roles for use when cloning AMIs for export

ROLE_NAME="s3admin-role"
PROFILE_NAME="${ROLE_NAME}"
TRUST_POLICY="trust.json"
PERMISSIONS="permissions.json"

############################################################################################################################################

# Create S3 role and instance profile
aws iam create-role --role-name "${ROLE_NAME}" --assume-role-policy-document file://${TRUST_POLICY} \
  --tags "Key=Name,Value=${ROLE_NAME}"

sleep 2

aws iam put-role-policy --role-name "${ROLE_NAME}" --policy-name "${ROLE_NAME}" --policy-document file://${PERMISSIONS}

sleep 2

#aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore --role-name "${WORKER_ROLE_NAME}"

aws iam create-instance-profile --instance-profile-name "${PROFILE_NAME}"

sleep 2

aws iam add-role-to-instance-profile --instance-profile-name "${PROFILE_NAME}" --role-name "${ROLE_NAME}"

sleep 2

exit 0

#!/bin/bash -xe
#
# Script to delete AWS IAM roles for use when cloning an AMI for export

ROLE_NAME="s3admin-role"
PROFILE_NAME="${ROLE_NAME}"
TRUST_POLICY="trust.json"
PERMISSIONS="permissions.json"

# Delete S3 Admin role and instance profile

aws iam delete-instance-profile --instance-profile-name "${PROFILE_NAME}"

sleep 2

aws iam delete-role-policy --role-name "${ROLE_NAME}" --policy-name "${ROLE_NAME}"

sleep 2

aws iam delete-role --role-name "${ROLE_NAME}"

sleep 2

exit 0

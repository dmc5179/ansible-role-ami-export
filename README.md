Role Name
=========

Export an AWS AMI to S3

Requirements
------------

- Install required python modules
```
python3 -m pip install --user -r requirements.txt
```

- Install required ansible collections
```
ansible-galaxy collection install -r requirements.yml
```

Role Variables
--------------
| Variable                     | Default              | Comments (type)                                               |
| :---                         | :---                 | :---                                                          |
| `temp_ami_id`                | 'ami-yyy'            | AMI ID for the temporary instance used during this role       |
| `instance_type`              | 'm5.xlarge'          | Instance type of the temporary instance user during this role |
| `iam_instance_profile`       | 's3admin-role'       | IAM instance profile of the temporary instance                |
| `key_name`                   | 'danclark'           | SSH Key pair name for the temporary instance                  |
| `vpc_subnet_id`              | 'subnet-xxx'         | VPC Subnet ID to place the temporary instance                 |
| `security_groups`            | 'default'            | Security Group for the temporary instance                     |
| `ami_id`                     | 'ami-xxx'            | AMI ID to be exported                                         |
| `s3_bucket`                  | 'my_bucket'          | S3 Bucket to place the AMI Export RAW Disk File               |
| `s3_path`                    | 'ami_exports'        | S3 Bucket path to place the AMI Export RAW Disk File          |

Dependencies
------------

- None

Example Playbook
----------------

```
ansible-playbook --extra-vars \
        "s3_bucket= s3_path= ami_id= temp_ami_id= key_name= vpc_subnet_id= security_groups=" \
        tests/test.yml
```

License
-------

BSD

Author Information
------------------

Dan Clark <danclark@redhat.com>

## aws_terraform_env
---
<br>

### config.tfvars
---
```
# ---------------------------
# Configure the AWS Provider Variable
# ---------------------------
# [profile xxxxx_user]
access_key = "ACCESS_KEY"
secret_key = "SECRET_KEY"
region     = "REGION"
zone       = "ZONE"

# [ General ]
project     = "SAMPLE_PJ"
environment = "SAMPLE_ENV"

# [ RDS connection ]
db_name     = "SAMPLE_DATABASE"
db_username = "SAMPLE_USER"
db_password = "SAMPLE_PASSWORD"
```
<br>

### terraform execution
---
* Note: Always run "terraform init" if data.tf or config.tfvars is changed.
```
terraform init
```
<br>

* Always run "plan" when creating, modifying, or deleting resources.
* When executing "plan" and "apply", refer to the variables in "config.tfvars".
```
terraform plan --var-file=./config.tfvars
```
```
terraform apply --var-file=./config.tfvars -auto-approve
```
<br>

### Get EC2 ami image
---
* ex ) ubuntu 18.04 LTS
```
aws ec2 describe-images \
    --region ap-northeast-1 \
    --owners 099720109477 \
    --query "reverse(sort_by(Images, &CreationDate))[:1]" \
    --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*" \
    --output table(base)
```
<br>

### RDS creating/deleting
---
Settings at creation
```
deletion_protection = true
skip_final_snapshot = false
```
* Execute terraform plan => apply in this order.

<br>

Settings at deletion
```
deletion_protection = false
skip_final_snapshot = true
```
* Execute terraform plan => apply in this order.
* Then comment out all the "RDS Instance" items and run terraform plan => apply again.
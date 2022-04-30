### aws_terraform_env
---
### config.tfvars
```
# ---------------------------
# Configure the AWS Provider Variable
# ---------------------------
# [profile xxxxx_user]
access_key = "ACCESS_KEY"
secret_key = "SECRET_KEY"
region     = "REGION"
zone       = "ZONE"
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
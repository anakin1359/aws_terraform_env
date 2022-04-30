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

### Note: Always run "terraform init" if data.tf or config.tfvars is changed.
```
terraform init
```
<br>

### Always run "plan" when creating, modifying, or deleting resources.
### When executing "plan" and "apply", refer to the variables in "config.tfvars".
```
terraform plan --var-file=./config.tfvars
```
```
terraform apply --var-file=./config.tfvars -auto-approve
```
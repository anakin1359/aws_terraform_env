# ---------------------------
# EC2 ami image setting
# ---------------------------
# amazon linux 2
# data "aws_ami" "amazon_linux2" {
#     most_recent = true
#     owners      = [ "137112412989"]

#     filter {
#         name   = "name"
#         values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
#     }

#     filter {
#         name   = "root-device-type"
#         values = ["ebs"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
# }

# ubuntu 18.04 LTS
data "aws_ami" "ubuntu-1804" {
    most_recent = true            # If there are multiple matches to the search criteria, select the latest one.
    owners      = [ "099720109477" ]

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

# ubuntu 20.04
# data "aws_ami" "ubuntu-2004" {
#     most_recent = true
#     owners      = [ "099720109477" ]

#     filter {
#         name   = "name"
#         values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#     }

#     filter {
#         name   = "root-device-type"
#         values = ["ebs"]
#     }

#     filter {
#         name   = "virtualization-type"
#         values = ["hvm"]
#     }
# }
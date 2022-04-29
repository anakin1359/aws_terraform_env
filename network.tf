# ---------------------------
# VPC
# ---------------------------
resource "aws_vpc" "main" {
    cidr_block                       = "192.168.0.0/20"
    instance_tenancy                 = "default"
    enable_dns_support               = true
    enable_dns_hostnames             = true
    assign_generated_ipv6_cidr_block = false

    tags = {
        Name    = "${var.project}-${var.environment}-vpc"
        Project = var.project
        Env     = var.environment
    }
}

# ---------------------------
# Subnet (Public)
# ---------------------------
resource "aws_subnet" "public-subnet-1a" {
    vpc_id                  = aws_vpc.main.id
    availability_zone       = "ap-northeast-1a"
    cidr_block              = "192.168.1.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name    = "${var.project}-${var.environment}-public-subnet-1a"
        Project = var.project
        Env     = var.environment
        Type    = "public"
    }
}

# resource "aws_subnet" "public-subnet-1c" {
#     vpc_id                  = aws_vpc.main.id
#     availability_zone       = "ap-northeast-1c"
#     cidr_block              = "192.168.2.0/24"
#     map_public_ip_on_launch = true

#     tags = {
#         Name    = "${var.project}-${var.environment}-public-subnet-1c"
#         Project = var.project
#         Env     = var.environment
#         Type    = "public"
#     }
# }
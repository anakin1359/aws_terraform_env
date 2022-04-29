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
        Name    = "${var.project}_${var.environment}_vpc"
        Project = var.project
        Env     = var.environment
    }
}

# ---------------------------
# Subnet (Public)
# ---------------------------
resource "aws_subnet" "public_subnet_1a" {
    vpc_id                  = aws_vpc.main.id
    availability_zone       = "ap-northeast-1a"
    cidr_block              = "192.168.1.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name    = "${var.project}_${var.environment}_public_subnet_1a"
        Project = var.project
        Env     = var.environment
        Type    = "public"
    }
}

# resource "aws_subnet" "public_subnet_1c" {
#     vpc_id                  = aws_vpc.main.id
#     availability_zone       = "ap-northeast-1c"
#     cidr_block              = "192.168.2.0/24"
#     map_public_ip_on_launch = true

#     tags = {
#         Name    = "${var.project}_${var.environment}_public_subnet_1c"
#         Project = var.project
#         Env     = var.environment
#         Type    = "public"
#     }
# }

# ---------------------------
# Route Table (Public)
# ---------------------------
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name    = "${var.project}_${var.environment}_public_route_table"
        Project = var.project
        Env     = var.environment
        Type    = "public"
    }
}

resource "aws_route_table_association" "public_route_table_1a" {
    route_table_id = aws_route_table.public_route_table.id
    subnet_id      = aws_subnet.public_subnet_1a.id
}

# resource "aws_route_table_association" "public-route-table-1c" {
#     route_table_id = aws_route_table.public_route_table.id
#     subnet_id = aws_subnet.public_subnet_1c.id
# }
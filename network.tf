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
# Subnet (Private)
# ---------------------------
resource "aws_subnet" "private_subnet_1a" {
    vpc_id                  = aws_vpc.main.id
    availability_zone       = "ap-northeast-1a"
    cidr_block              = "192.168.3.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name    = "${var.project}_${var.environment}_private_subnet_1a"
        Project = var.project
        Env     = var.environment
        Type    = "private"
    }
}

resource "aws_subnet" "private_subnet_1c" {
    vpc_id                  = aws_vpc.main.id
    availability_zone       = "ap-northeast-1c"
    cidr_block              = "192.168.4.0/24"
    map_public_ip_on_launch = true

    tags = {
        Name    = "${var.project}_${var.environment}_private_subnet_1c"
        Project = var.project
        Env     = var.environment
        Type    = "private"
    }
}

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
#     subnet_id      = aws_subnet.public_subnet_1c.id
# }

# ---------------------------
# Route table (Private)
# ---------------------------
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name    = "${var.project}_${var.environment}_private_route_table"
        Project = var.project
        Env     = var.environment
        Type    = "private"
    }
}

resource "aws_route_table_association" "private_route_table_1a" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private_subnet_1a.id
}

resource "aws_route_table_association" "private_route_table_1c" {
    route_table_id = aws_route_table.private_route_table.id
    subnet_id = aws_subnet.private_subnet_1c.id
}

# ---------------------------
# Internet Gateway
# ---------------------------
resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name    = "${var.project}_${var.environment}_internet_gateway"
        Project = var.project
        Env     = var.environment
    }
}

resource "aws_route" "public_route_table_internet_gateway" {
    route_table_id         = aws_route_table.public_route_table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.internet_gateway.id
}
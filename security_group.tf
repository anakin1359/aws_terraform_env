# ---------------------------
# Security Group (web)
# ---------------------------
resource "aws_security_group" "web_security_group" {
    name        = "${var.project}_${var.environment}_web_security_group"
    description = "web front role security group"
    vpc_id      = aws_vpc.main.id

    tags = {
        Name    = "${var.project}_${var.environment}_web_security_group"
        Project = var.project
        Env     = var.environment
    }
}

resource "aws_security_group_rule" "web_in_http" {
    security_group_id = aws_security_group.web_security_group.id
    type              = "ingress"
    protocol          = "tcp"
    from_port         = 80
    to_port           = 80
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_in_https" {
    security_group_id = aws_security_group.web_security_group.id
    type              = "ingress"
    protocol          = "tcp"
    from_port         = 443
    to_port           = 443
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_in_ssh" {
    security_group_id = aws_security_group.web_security_group.id
    type              = "ingress"
    protocol          = "tcp"
    from_port         = 22
    to_port           = 22
    cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "web_out_tcp3306" {
    security_group_id = aws_security_group.web_security_group.id
    type                     = "egress"
    protocol                 = "tcp"
    from_port                = 3306
    to_port                  = 3306
    source_security_group_id = aws_security_group.rds_security_group.id
}

# ---------------------------
# Security Group (rds)
# ---------------------------
resource "aws_security_group" "rds_security_group" {
    name        = "${var.project}_${var.environment}_rds_security_group"
    description = "database server role security group."
    vpc_id      = aws_vpc.main.id

    tags = {
        Name    = "${var.project}_${var.environment}_rds_security_group"
        Project = var.project
        Env     = var.environment
    }
}

resource "aws_security_group_rule" "rds_in_tcp3306" {
    security_group_id = aws_security_group.rds_security_group.id
    type                     = "ingress"
    protocol                 = "tcp"
    from_port                = 3306
    to_port                  = 3306
    source_security_group_id = aws_security_group.web_security_group.id
}
# ---------------------------
# RDS Parameter Group
# ---------------------------
# resource "aws_db_parameter_group" "mysql_parameter_group" {
#     name   = "mysql-parameter-group"
#     family = "mysql8.0"

#     parameter {
#         name  = "character_set_database"
#         value = "utf8mb4"
#     }

#     parameter {
#         name  = "character_set_server"
#         value = "utf8mb4"
#     }

#     parameter {
#         name  = "character_set_client"
#         value = "utf8mb4"
#     }
# }

# ---------------------------
# RDS Option Group
# # ---------------------------
# resource "aws_db_option_group" "mysql_option_group" {
#     name                     = "mysql-option-group"
#     engine_name              = "mysql"
#     major_engine_version     = "8.0"
#     option_group_description = "terraform rds option group."
# }

# ---------------------------
# RDS Subnet Group
# ---------------------------
# resource "aws_db_subnet_group" "mysql_subnet_group" {
#     name = "mysql-subnet-group"
#     subnet_ids = [
#         aws_subnet.private_subnet_1a.id,
#         aws_subnet.private_subnet_1c.id
#     ]

#     tags = {
#         Name    = "${var.project}_${var.environment}_mysql_subnet_group"
#         Project = var.project
#         Env     = var.environment
#     }
# }

# ---------------------------
# RDS Instance
# ---------------------------
# resource "aws_db_instance" "db_cassis" {
#     engine         = "mysql"
#     engine_version = "8.0.20"

#     # rds connection settings
#     identifier     = "mysql-db-cassis" # Name of RDS instance
#     name           = "${var.db_name}"
#     username       = "${var.db_username}"
#     password       = "${var.db_password}"
#     port           = 3306

#     # rds performance settings
#     instance_class        = "db.t2.micro"
#     allocated_storage     = 10
#     max_allocated_storage = 20
#     storage_type          = "gp2"
#     storage_encrypted     = false

#     # rds  availability settings
#     multi_az               = false
#     availability_zone      = "ap-northeast-1a"
#     db_subnet_group_name   = aws_db_subnet_group.mysql_subnet_group.name
#     vpc_security_group_ids = [ aws_security_group.rds_security_group.id ]
#     publicly_accessible    = false                                         # Specify whether public access is allowed or not (default is false).

#     # rds backup and maintenance settings
#     backup_window              = "04:00-05:00"
#     backup_retention_period    = 7
#     maintenance_window         = "Mon:05:00-Mon:08:00"
#     auto_minor_version_upgrade = false
#     apply_immediately          = true

#     # rds misoperation prevention
#     deletion_protection = false   # "true" when created,  "false" when deleted.
#     skip_final_snapshot = true    # "false" when created, "true" when deleted.

#     # rds option settings
#     parameter_group_name = aws_db_parameter_group.mysql_parameter_group.name
#     option_group_name    = aws_db_option_group.mysql_option_group.name

#     tags = {
#         Name    = "${var.project}_${var.environment}_db_cassis"
#         Project = var.project
#         Env     = var.environment
#     }
# }
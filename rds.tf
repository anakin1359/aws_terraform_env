# ---------------------------
# RDS Parameter Group
# ---------------------------
resource "aws_db_parameter_group" "mysql_parameter_group" {
    name   = "mysql-parameter-group"
    family = "mysql8.0"

    parameter {
        name  = "character_set_database"
        value = "utf8mb4"
    }

    parameter {
        name  = "character_set_server"
        value = "utf8mb4"
    }

    parameter {
        name  = "character_set_client"
        value = "utf8mb4"
    }
}

# ---------------------------
# RDS Option Group
# ---------------------------
resource "aws_db_option_group" "mysql_option_group" {
    name = "mysql-option-group"
    engine_name = "mysql"
    major_engine_version = "8.0"

    option {
        option_name = "Timezone"

        option_settings {
            name = "TIME_ZONE"
            value = "Asia/Tokyo"
        }
    }
}

# ---------------------------
# RDS Subnet Group
# ---------------------------

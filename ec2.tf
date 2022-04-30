# ---------------------------
# Key Pair
# ---------------------------
resource "aws_key_pair" "ssh_keypair" {
    key_name = "${var.project}_${var.environment}_ssh_keypair"
    public_key = file("./id_rsa.pub")

    tags = {
        Name    = "${var.project}_${var.environment}_ssh_keypair"
        Project = var.project
        Env     = var.environment
    }
}

# ---------------------------
# EC2 Instance
# ---------------------------
# resource "aws_instance" "app_cassis" {
#     # setting resource
#     ami           = data.aws_ami.ubuntu-1804.id
#     instance_type = "t2.micro"

#     # binf subnet-address
#     subnet_id                   = aws_subnet.public_subnet_1a.id
#     associate_public_ip_address = true                            # Whether to associate a public IP address with an instance in a VPC.

#     # bind secrity-group
#     vpc_security_group_ids = [
#         aws_security_group.web_security_group.id
#     ]

#     # bind ssh_keypair
#     key_name = aws_key_pair.ssh_keypair.key_name

#     tags = {
#         Name    = "${var.project}_${var.environment}_app_cassis"
#         Project = var.project
#         Env     = var.environment
#     }
# }
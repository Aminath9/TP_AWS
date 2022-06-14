# provider "aws" {
#     region = "us-east-2"
#     access_key = "AKIAZM5QZOLPIBCJGMCT"
#     secret_key = "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"
# }

# resource "aws_security_group" "instance_sg" {
#     name = "Aminath-terraform-sg"

#     egress {
#         from_port       = 0
#         to_port         = 0
#         protocol        = "-1"
#         cidr_blocks     = ["0.0.0.0/0"]
#     }

#     egress {
#         from_port   = 80
#         to_port     = 80
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#      egress {
#         from_port   = 443
#         to_port     = 443
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#      egress {
#         from_port   = 22
#         to_port     = 22
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#      ingress {
#         from_port   = 22
#         to_port     = 22
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     ingress {
#         from_port   = 80
#         to_port     = 80
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#      ingress {
#         from_port   = 443
#         to_port     = 443
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }


# resource "aws_instance" "my_ec2_Aminath" {
#     ami = "ami-07c1207a9d40bc3bd"
#     instance_type = "t2.micro"
#     vpc_security_group_ids = [aws_security_group.instance_sg.id]

#         user_data = <<-EOF
#             #!/bin/bash
#             sudo apt-get update
#             sudo apt-get install -y apache2
#             sudo systemctl start apache2
#             sudo systemctl enable apache2
#             sudo echo "<h1>Hello students</h1>" > /var/www/html/index.html
#         EOF
        
#         tags = {
#             Name = "Aminath terraform"
#         }
# }
module "website_s3_bucket" {
    source = "./modules/aws-s3-static-website-bucket"
    bucket_name = "devopssec-terraform-aminath"
}

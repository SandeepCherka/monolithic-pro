provider "aws" {
region = "us-east-1"
access_key = "AKIAZUZOHD2I57F65YGA"
secret_key = "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"

}

resource "aws_instance" "one" {
ami = "ami-0f409bae3775dc8e5"
instance_type = "t2.micro"
key_name = "Surabhi"
vpc_security_group_ids = [aws_security_group.two.id]
tags = {
Name = "My-Instance"
}
}

resource "aws_security_group" "two" {
  name = "elb-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

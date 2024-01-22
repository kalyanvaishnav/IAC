provider "aws" {
      access_key = "AKIAYM3FRFOWGGA7ZGJT"
      secret_key = "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"
      region = "ap-south-1"
}

resource "aws_instance" "web" {
    ami                                  = "ami-03f4878755434977f"
    instance_type                        = "t2.micro"
    key_name                             = "aws-key"
    security_groups                      = [
        "web-sg",
    ]
    subnet_id                            = "subnet-00d659c6d4fb45c41"
    tags                                 = {
        "Name" = "web"
    }
    tags_all                             = {
        "Name" = "web"
    }
    vpc_security_group_ids               = [
        "sg-078a71081110982b5",
    ]
}
resource "aws_security_group" "web-sg" {
    description = "web-sg"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
    ]
    name        = "web-sg"
    vpc_id      = "vpc-05c1633e03f4ca87b"
}

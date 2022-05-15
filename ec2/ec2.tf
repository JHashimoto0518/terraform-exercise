resource "aws_security_group" "SessoinManagerTrialSG" {
    description = "for Session Manager Trial"
    name = "npd-dev3-sg-sessoin_manager_trial"
    vpc_id = "vpc-56253a31"
    ingress {
        cidr_blocks = [
            "118.87.133.149/32"
        ]
        description = "Allow to connect with ssh"
        protocol = "tcp"
        from_port = 22
        to_port = 22
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }

    tags = {
        Name = "npd-dev3-sg-sessoin_manager_trial"
    }
}

resource "aws_instance" "SessionManagerTrial" {
    ami = "ami-0cd744adeca97abb1"
    instance_type = "t2.micro"
    key_name = "npd-dev3-key-session_manager_trial"
    availability_zone = "ap-northeast-1a"
    tenancy = "default"
    subnet_id = "subnet-39944c71"
    ebs_optimized = true
    vpc_security_group_ids = [
        "${aws_security_group.SessoinManagerTrialSG.id}"
    ]
    source_dest_check = true
    root_block_device {
        volume_size = 128
        volume_type = "gp2"
        delete_on_termination = true
    }

    tags = {
        Name = "npd-dev3-ec2-session_manager_trial"
    }
}
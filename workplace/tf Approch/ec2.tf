resource "aws_instance" "workspace_demo" {
  instance_type = var.instance_type
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [
        aws_security_group.workspace_demo.id
        ]

  tags = var.ec2_tags
}

resource "aws_security_group" "workspace_demo" {
  name        = "roboshop-workspace-demo"
  description = "A common instance security group for all instances"
  
 

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
    from_port        = var.from_port
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }


  tags = {
    Name = "roboshop-workspace-demo"
  } 
  lifecycle {
    create_before_destroy = true
  }
}

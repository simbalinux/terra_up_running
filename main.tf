# create a data source for the purpose of capturing the AMI ID of a specific image 
# *** 'aws ec2 describe-images --image-ids ami-40d28157 --region us-east-1' *** 

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]

  }
}

resource "aws_instance" "example" {  
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p "{$var.server_port}" &
    EOF

  tags {    
    Name = "terraform-example"  
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
 
  ingress {
    from_port = "${var.server_port}"
    to_port   = "${var.server_port}"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}

output "image_id" {
  value = "${data.aws_ami.ubuntu.id}"
}

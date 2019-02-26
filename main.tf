resource "aws_instance" "example" {  
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t1.micro"
  tags {    
    Name = "terraform-example"  
  }
}

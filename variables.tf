variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-west-2"
}
variable "amis" {
  type = "map"
  default = {
    "us-west-2" = "ami-07c2e617785343806"
  }
}

variable "server_port" {
  description = "server port to use for http requests"
  default = 8080
}

 

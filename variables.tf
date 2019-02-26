variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
  }
}

variable "server_port" {
  description = "server port to use for http requests"
  default = 8080
}

 

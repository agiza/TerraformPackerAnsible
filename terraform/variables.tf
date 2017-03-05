variable "access_key" {
  description = "access_key"
  default = "CHANGEME!"
}

variable "secret_key" {
  description = "secret_key"
  default = "CHANGEME!"
}

variable "region" {
  default = "eu-west-1"
}

variable "availability_zone"{
  default = "eu-west-1a"
}

variable "instance_type" {
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "key_name" {
  default = "adrian-aws"
}

variable "amis" {
    description = "AMIs by region"
    default = {
        eu-west-1 = "ami-11c57862" # Debian 8
    }
}

#variable "availability_zones" {
#  default     = "us-west-2a,us-west-2b,us-west-2c"
#  default     = "eu-west-1a, eu-west-1b, eu-west-1c"
#  description = "List of availability zones"
#}

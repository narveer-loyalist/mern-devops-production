variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "key_name" {
  description = "SSH key name"
}

variable "ssh_key_path" {
  description = "Path to the private key file for SSH access"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key name"
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
}

variable "ssh_key_path" {
  description = "Path to the private key file for SSH access"
  type        = string
}

variable "ec2_instance_type" {
  description = "The type of AWS instance to create"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-04f167a56786e4b09"
}

variable "root_block_device" {
  description = "Root block device configuration"
  type        = map(string)
  default = {
    volume_size           = "8"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }
}
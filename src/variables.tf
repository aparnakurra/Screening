# variables.tf

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of instance to deploy"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
  default     = "ami-01fccab91b456acc2"
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
  default     = "TerraformWebServer"
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "web_sg"
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Allow HTTP and SSH traffic"
}

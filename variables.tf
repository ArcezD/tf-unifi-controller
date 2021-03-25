variable "environment" {
  description = "Environment"
  type        = string
  default     = "prod"
}

variable "ec2_key_pair_name" {
  description = "AWS EC2 ssh key pair name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "AWS VPC name"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  description = "AWS VPC cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "AWS VPC cidr"
  type        = string
  default     = "10.0.1.0/24"
}

variable "ec2_instance_type" {
  description = "AWS ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_private_ip" {
  description = "AWS ec2 private ip"
  type        = string
  default     = "10.0.1.10"
}

variable "ec2_instance_name" {
  description = "AWS ec2 name"
  type        = string
  default     = "UniFi Network Controller"
}
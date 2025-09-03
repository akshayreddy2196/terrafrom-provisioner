variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_1_cidr" {
  description = "CIDR block for subnet 1"
  default     = "10.0.1.0/24"
}

variable "subnet_2_cidr" {
  description = "CIDR block for subnet 2"
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "Availability Zone for subnet 1"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "Availability Zone for subnet 2"
  default     = "us-east-1b"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-00ca32bbc84273381" # Amazon Linux 2 (update as needed)

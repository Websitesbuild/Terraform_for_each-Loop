variable "myAMI" {
  description = "AMI-Type"
  type = string
  default = "ami-0ec10929233384c7f"
}

variable "machine-type" {
  description = "Machine-type"
  type = string
  default = "t2.nano"
}


variable "instances" {
  description = "EC2 machine details"
  default = {
    "instance-1" = {
      ami = "ami-0ec10929233384c7f"
      instance_type = "t2.nano"
    }

    "instance-2" = {
      ami = "ami-098e39bafa7e7303d"
      instance_type = "t2.micro"
    }

    "instance-3" = {
      ami = "ami-0ec10929233384c7f"
      instance_type = "t2.medium"
    }
  }
}

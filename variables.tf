variable "az" {
  type = list(string)
}

variable "public-cidr" {
  type = list(string)
}

variable "private-cidr" {
  type = list(string)
}

variable "cidr-range" {
  type = string
}

variable "vpc-name" {
  type = string
}

variable "igw-name" {
  type = string
}

variable "igw_cidr" {
  type = string
}

variable "rt-name" {
  type = string
}

variable "sg-name" {
  type = string
}

variable "ami-id" {
  type = string
}

variable "type" {
  type = string
}

variable "cnt" {
  type = string
}

variable "i-name" {
  type = string
}

variable "in" {
  type = list(object({
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
}

variable "lb-type" {
  type = string
}

variable "lb-name" {
  type = string
}

variable "tg-name" {
  type = string
}

variable "protocol" {
  type = string
}

variable "port" {
  type = number
}

variable "action_type" {
  type = string
}

variable "asg-name" {
  type = string
}

variable "max-size" {
  type = number
}

variable "min-size" {
  type = number
}

variable "desired" {
  type = number
}

variable "health_check_type" {
  type = string
}

variable "policy-name" {
  type = string
}

variable "policy_type" {
  type = string
}

variable "target_value" {
  type = number
}
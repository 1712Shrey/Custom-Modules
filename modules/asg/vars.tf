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

variable "lb-id" {
  type = string
}

variable "tg-arn" {
  type = string
}

variable "subnet-id" {
  type = set(string)
}

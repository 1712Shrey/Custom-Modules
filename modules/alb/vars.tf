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

variable "subnet-id" {
  //type = list(string)
  type = set(string)
}

variable "sg-id" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "instance-id" {
  type = list(string)
}

variable "cnt" {
  type = number
}
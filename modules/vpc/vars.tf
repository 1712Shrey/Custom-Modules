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

variable "in" {
  type = list(object({
    protocol    = string
    from_port   = string
    to_port     = string
    cidr_blocks = list(string)
  }))
}
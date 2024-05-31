variable "aws_network" {
  type = string
}

variable "aws_sub_network" {
  type = list(string)
}

variable "aws_sub_names" {
  type = list(string)
}

variable "aws_AZ" {
  type = list(string)
}

variable "aws_db" {
  type = list(string)

}

variable "aws_app" {
  type = string
}

variable "webssg" {
  type = object({
    name = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}

variable "appssg" {
  type = object({
    name = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}

variable "dbssg" {
  type = object({
    name = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
}


variable "aws_private" {
  type    = string
  default = "~/.ssh/id_rsa"
}
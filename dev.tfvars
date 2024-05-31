aws_network     = "10.10.0.0/16"
aws_sub_network = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
aws_sub_names   = ["web1", "web2", "app1", "app2", "db1", "db2"]
aws_AZ          = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a", "ap-south-1b", "ap-south-1c"]
aws_db          = ["db1", "db2"]
aws_app         = "app2"
webssg = {
  name = "web"
  rules = [{
    type        = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    }, {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    }, {
    type        = "egress"
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]
}

appssg = {
  name = "app"
  rules = [{
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    }, {
    type        = "ingress"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    }, {
    type        = "egress"
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]
}

dbssg = {
  name = "db"
  rules = [{
    type        = "ingress"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    }, {
    type        = "egress"
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }]
}
resource "aws_security_group" "web" {
  name   = "nnameee"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.webssg.name
  }
  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "webssg" {
  security_group_id = aws_security_group.web.id
  count             = length(var.webssg.rules)
  type              = var.webssg.rules[count.index].type
  from_port         = var.webssg.rules[count.index].from_port
  to_port           = var.webssg.rules[count.index].to_port
  protocol          = var.webssg.rules[count.index].protocol
  cidr_blocks       = [var.webssg.rules[count.index].cidr_blocks]
  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group" "app" {
  name   = "nnamee"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.appssg.name
  }
  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "appssg" {
  security_group_id = aws_security_group.app.id
  count             = length(var.appssg.rules)
  type              = var.appssg.rules[count.index].type
  from_port         = var.appssg.rules[count.index].from_port
  to_port           = var.appssg.rules[count.index].to_port
  protocol          = var.appssg.rules[count.index].protocol
  cidr_blocks       = [var.appssg.rules[count.index].cidr_blocks]
  depends_on = [
    aws_security_group.app
  ]
}

resource "aws_security_group" "db" {
  name   = "nname"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.dbssg.name
  }
  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_security_group_rule" "dbssg" {
  security_group_id = aws_security_group.db.id
  count             = length(var.dbssg.rules)
  type              = var.dbssg.rules[count.index].type
  from_port         = var.dbssg.rules[count.index].from_port
  to_port           = var.dbssg.rules[count.index].to_port
  protocol          = var.dbssg.rules[count.index].protocol
  cidr_blocks       = [var.dbssg.rules[count.index].cidr_blocks]
  depends_on = [
    aws_security_group.db
  ]
}
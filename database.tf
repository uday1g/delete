#data "aws_subnets" "subs" {
#  filter {
#   name   = "tag:Name"
#    values = var.aws_db
#  }
#  depends_on = [
#    aws_vpc.main,
#    aws_subnet.nteir-sub
#  ]
#}

#resource "aws_db_subnet_group" "db_sub" {
#  name       = "wait"
#  subnet_ids = data.aws_subnets.subs.ids
#  depends_on = [
#    aws_vpc.main,
#    aws_subnet.nteir-sub
#  ]
#}

#resource "aws_db_instance" "default" {
#  allocated_storage      = 10
#  db_name                = "mydb"
#  engine                 = "mysql"
#  engine_version         = "8.0"
#  instance_class         = "db.t3.micro"
#  username               = "foo"
#  password               = "foobarbaz"
#  skip_final_snapshot    = true
#  identifier             = "createdudatkmsdn"
#  db_subnet_group_name   = aws_db_subnet_group.db_sub.id
#  vpc_security_group_ids = [aws_security_group.db.id]
#  depends_on = [
#    aws_vpc.main,
#    aws_security_group.db,
#    aws_subnet.nteir-sub
#  ]
#}
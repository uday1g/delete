#resource "aws_key_pair" "deployer" {
#  key_name   = "deployer"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIAyxyCGLkYo9bkMsUM15yIkouGCeE41PFdmVtDZHZZ8gT0S236mTU0ZFlyytJeik4FhdFDu46nw+u/uIENaOajgXEbiVPY16SVjVrNWOabsa0zH92QsHlHOvFGozP8yec7k/Sid7GBdPBiJyZmtqVGwX9OaHkkhK+XUuDjWmM/3GAWJLUiieXh6B4cqljVHhpKmbjVAwhaTrWkS0yrVLjz5RXC41Hh+I4hHkFt7Jko3RkIicr+XyGaAmmO4+GLKCjJFrwN2ZFRFiJcKdz4gqvMA0kpzz4fbU5N1f8ATb7jPrLGcGarJhEm+D5JxSeHWEFaom5jbhM36cA6WNuOqiTXk15Ww0hzRHU9W2s8nW7CY8IUTbdp+OiTAItt2IgTX7CV5LApACHbh1/onRAhIpvQ6oq5Y1rr2VVyUzNKKWzanZNFQklzKPI42Hd/pplokzta4FNEVn++xu4A2PNS4xreB1wZvGOke4EoP2H1ZOa3647+Rs1wEMYI3/8p04E2J0= Gangisetty Udaykiran@LAPTOP-K2PP0GU1"#

#}

#data "aws_subnet" "app" {
#  filter {
#    name   = "tag:Name"
#    values = [var.aws_app]
#  }
#  depends_on = [
#    aws_vpc.main,
#    aws_subnet.nteir-sub
#  ]
#}

#resource "aws_instance" "vm" {
# ami                         = "ami-0f58b397bc5c1f2e8"
#  instance_type               = "t2.micro"
#associate_public_ip_address = true
#  subnet_id                   = data.aws_subnet.app.id
#  key_name                    = aws_key_pair.deployer.key_name
#  vpc_security_group_ids      = [aws_security_group.app.id]
#  connection {
#    type        = "ssh"
#    user        = "ubuntu"
#    host        = self.public_ip
#    private_key = file(var.aws_private)
#  }
#  provisioner "file" {
#   source      = "./installjenkins.sh"
#   destination = "/installjenkins.sh"
#  }
#  provisioner "remote-exec" {
#     inline = [ 
#      "chmod +x /installjenkins.sh",
#      "/installjenkins.sh args",
#     ]
# }

#  depends_on = [
#    aws_vpc.main,
#    data.aws_subnet.app,
#   aws_key_pair.deployer
#  ]
#}

#resource "null_resource" "script_executor" {#

#provisioner "remote-exec" {
#  inline = [
#   "sudo apt update",
#   "sudo apt install openjdk-11-jdk -y",
#   "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar",
#   "java -jar /tmp/spring-petclinic-2.4.2.jar &",
#   "sleep 20s"
#  ]
#  connection {
#     type        = "ssh"
#     user        = "ubuntu"
#    private_key = file(var.aws_private)
#     host        = aws_instance.vm.public_ip
#   }
# }
# triggers = {
#   app_script_version = var.app_script_version
# }

# depends_on = [aws_instance.vm]
#}

#variable "app_script_version" {
#  type    = string
#  default = "0"

#}

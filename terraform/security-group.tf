resource "aws_security_group" "webserver_fw" {
  name = "webserver_fw"
  description = "WebServer_FW"
  vpc_id = "${aws_vpc.webserver_vpc_net.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 3000
      to_port = 3000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
   from_port = 8
   to_port = 0
   protocol = "icmp"
   cidr_blocks = ["0.0.0.0/0"]
 }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "WebServer_fw"
  }
}

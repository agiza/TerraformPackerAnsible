resource "aws_vpc" "webserver_vpc_net" {
     cidr_block = "10.10.0.0/16"
     enable_dns_hostnames = true
     tags {
         Name = "WebServer VPC"
     }
}

resource "aws_subnet" "webserver_vpc_sub" {
  vpc_id                  = "${aws_vpc.webserver_vpc_net.id}"
  cidr_block              = "10.10.0.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags {
    Name = "WebServer Sub"
  }
}

resource "aws_internet_gateway" "webserver_vpc_gw" {
    vpc_id = "${aws_vpc.webserver_vpc_net.id}"
    tags {
        Name = "WebServer GW"
    }
}

resource "aws_route_table" "webserver_vpc_rt" {
    vpc_id = "${aws_vpc.webserver_vpc_net.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.webserver_vpc_gw.id}"
    }
    tags {
        Name = "WebServer RT"
    }
}

resource "aws_route_table_association" "webserver_vpc_rtassoc" {
    subnet_id      = "${aws_subnet.webserver_vpc_sub.id}"
    route_table_id = "${aws_route_table.webserver_vpc_rt.id}"
}

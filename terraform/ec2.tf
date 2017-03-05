resource "aws_instance" "webserver-1" {
    instance_type               = "${var.instance_type}"
    availability_zone           = "${var.availability_zone}"
    ami                         = "${lookup(var.amis, var.region)}"
    key_name                    = "${var.key_name}"
    associate_public_ip_address = true
    subnet_id                   = "${aws_subnet.webserver_vpc_sub.id}"
    security_groups             = ["${aws_security_group.webserver_fw.id}"]
    tags {
      Name = "WebServer-1"
    }
    provisioner "remote-exec" {
      inline = [
        "sudo apt-get update",
        "sudo apt-get -y dist-upgrade",
        "sudo apt-get -y install python-pip nginx npm",
        "sudo pip install ansible"
      ]
      connection {
        user        = "admin"
        private_key = "${file("/Users/adrian/Downloads/adrian-aws.pem")}"
        timeout     = "1m"
        agent       = false
      }
  }
}

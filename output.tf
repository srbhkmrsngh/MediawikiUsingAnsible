output "private_ip" {
  value = "${aws_instance.app.private_ip}"
}
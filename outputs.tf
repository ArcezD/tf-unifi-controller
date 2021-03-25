output "name" {
  value = "https://${aws_instance.unifi_controller.public_dns}:8443"
}
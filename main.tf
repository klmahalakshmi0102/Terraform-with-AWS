terraform {
  required_version = ">= 0.12"
}
resource "local_file" "example_file" {
  filename = "${path.module}/hello.txt"
  content  = "Hello! This file was created by Terraform."
}
variable "environment" {
    description = "Environment name"
    type = string
    default = "staging"
  
}
variable "bucket_name" {
    description = "S3 Bucket Name"
    type = string
    default = "my-terraform-bucket-0102"
  
}
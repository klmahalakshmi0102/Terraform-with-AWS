# Random suffix to ensure global uniqueness
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Using count with list variable
resource "aws_s3_bucket" "bucket1" {
  count = length(var.bucket_names)

  bucket = "${var.bucket_names[count.index]}-${random_id.bucket_suffix.hex}"
  tags   = var.tags
}

# Using for_each with set variable (recommended)
resource "aws_s3_bucket" "bucket2" {
  for_each = var.bucket_name_set

  bucket = "${each.key}-${random_id.bucket_suffix.hex}"
  tags   = var.tags

  depends_on = [aws_s3_bucket.bucket1]
}
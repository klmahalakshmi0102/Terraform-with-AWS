variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Name        = "Dev-s3-bucket"
    created_by = "terraform"
  }
}

variable "bucket_names" {
  description = "list of s3 bucket names to create using count"
  type        = list(string)
  default     = [
    "my-test-bucket-klm",
    "my-test-bucket-kjr"
  ]
}

variable "bucket_name_set" {
  description = "set of s3 bucket names to create using for_each"
  type        = set(string)
  default     = [
    "my-test-bucket-12345ajhbd",
    "my-test-bucket-12355jhedew"
  ]
}

terraform {

    backend "s3" {
        bucket = "my-tf-test-bucket-0102"
        key = "dev/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
      
    }


    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"
}


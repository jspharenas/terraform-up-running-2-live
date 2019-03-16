provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket = "f0084r-terraform-up-running-remote-state"
    key = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region = "us-east-1"
    encrypt = "true"
  }
}


resource "aws_s3_bucket" "f0084r-terraform-up-running-remote-state" {
  bucket = "f0084r-terraform-up-running-remote-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags {
    Name = "Terraform Up and Running S3 Remote State Store"
  }
}


resource "aws_dynamodb_table" "terraform-state-lock" {
  name = "terraform-state-lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

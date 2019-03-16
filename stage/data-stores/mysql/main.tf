provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "f0084r-terraform-up-running-remote-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    dynamodb_table = "terraform-state-lock"
    region = "us-east-1"
    encrypt = "true"
  }
}

resource "aws_db_instance" "example" {
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = "example_database"
  username = "admin"
  password = "${var.db_password}"
  skip_final_snapshot = true
}

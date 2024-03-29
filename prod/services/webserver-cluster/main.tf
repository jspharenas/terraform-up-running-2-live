provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "git::git@github.com:jspharenas/terraform-up-running-2-modules.git//services/webserver-cluster?ref=v0.0.3"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "f0084r-terraform-up-running-remote-state"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
  enable_autoscaling = true
}

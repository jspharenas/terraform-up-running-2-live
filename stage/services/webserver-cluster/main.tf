provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"
  #source = "git::git@github.com:jspharenas/terraform-up-running-2-modules.git//services/webserver-cluster?ref=v0.0.2"

  cluster_name = "webservers-stage"
  db_remote_state_bucket = "f0084r-terraform-up-running-remote-state"
  db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
  enable_autoscaling = false
}

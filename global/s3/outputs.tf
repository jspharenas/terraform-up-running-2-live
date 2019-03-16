output "s3_bucket_arn" {
  value = "${aws_s3_bucket.f0084r-terraform-up-running-remote-state.arn}"
}


output "dynamodb_table_arn" {
  value = "${aws_dynamodb_table.terraform-state-lock.arn}"
}

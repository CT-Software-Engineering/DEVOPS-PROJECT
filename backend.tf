

terraform {
  backend "s3" {
    bucket = "terraform-state-awake"
    key    = "eks/awake-cicd/statefile"
    region = "eu-west-1"
  }
}

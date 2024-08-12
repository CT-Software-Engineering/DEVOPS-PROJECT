

terraform {
  backend "s3" {
    bucket = "terraform-state-awake"
    key    = "eks/awake/statefile"
    region = "eu-west-1"
  }
}

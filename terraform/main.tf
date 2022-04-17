terraform {

  backend "s3" {
    bucket = "test-bucket-for-lessons"                       // Bucket where to SAVE Terraform State
    key    = "lesson-Docker-CI-CD/tfstate/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "eu-west-1"                                     // Region where bycket created
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

output "aws_availability_zones_availabale" {
  value = data.aws_availability_zones.available.names[*]
}

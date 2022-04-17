terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}


terraform {

  backend "s3" {
    bucket = "test-bucket-for-lessons"                    // Bucket where to SAVE Terraform State
    key    = "NEW-Docker-CI-CD/tfstate/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "eu-west-1"                                  // Region  where bycket created
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

output "aws_availability_zones_availabale" {
  value = data.aws_availability_zones.available.names[0]
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "test-bucket-for-lessons"                // Bucket from where to GET Terraform State
    key    = "lesson-CI-CD/tfstate/terraform.tfstate" // Object name in the bucket to GET Terraform state
    region = "eu-west-1"                              // Region where bycket created
  }
}

output "remote_state_my_vpc_id" {
  value = data.terraform_remote_state.network.outputs.my_vpc_id
}

output "remote_state_my_sg_id" {
  value = data.terraform_remote_state.network.outputs.my_sg_id
}


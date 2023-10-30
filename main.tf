terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.23.1"
    }
  }
}
//provider configuration

provider "aws" {
  region = "us-west-2"
}

//variable declaration
variable "bucket_list" {
 type = list
 default = ["adventuretech-na-bucket","natureescape-na-bucket","datasummit-na-bucket","codecarnival-na-bucket"]

}
//creating the buckets
resource "aws_s3_bucket" "event_themes" {
  for_each = toset(var.bucket_list)
  bucket = each.key
}
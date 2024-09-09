provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}



resource "aws_s3_object" "example_file" {
  bucket  = "tfsecamp2024"
  key     = "Dan C" //change this to your name obviously
  content = "lipso"
}

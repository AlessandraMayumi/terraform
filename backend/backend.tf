terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "bucket-vntalza"
    region = "us-east-1"
  }
}

terraform {
  backend "s3" {
    bucket = "aashish-devsecops-tfstate"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

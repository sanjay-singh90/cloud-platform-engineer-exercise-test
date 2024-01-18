terraform {
  backend "s3" {
    bucket         = "platform-eng-test-bucket"
    key            = "sample-app.tfstate"
    region         = "us-east-1"
  }
}

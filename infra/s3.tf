resource "aws_s3_bucket" "sample_app" {
  bucket = "platform-eng-test-bucket"
  
  tags = {
    Name    = "SampleAppBucket"
    Project = "SampleApp"
  }
}
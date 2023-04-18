provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_instance_1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  count         = 2

  tags = {
    Name = "EC2 Instance 1"
  }
}

resource "aws_s3_bucket" "s3_bucket_1" {
  bucket = "my-s3-bucket"
}

output "ec2_instance_ids" {
  value = aws_instance.ec2_instance_1.*.id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.s3_bucket_1.id
}

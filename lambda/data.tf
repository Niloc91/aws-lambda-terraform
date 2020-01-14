data "archive_file" "default" {
  output_path = "${path.module}/source/lambda.zip"
  source_file = "${path.module}/source/lambda.py"
  type        = "zip"
}

data "aws_caller_identity" "default" {}


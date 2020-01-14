data "archive_file" "default" {
  output_path = "${path.module}/src/lambda.zip"
  source_file = "${path.module}/src/lambda.py"
  type        = "zip"
}

data "aws_caller_identity" "default" {}


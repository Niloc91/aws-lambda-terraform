resource "aws_iam_role" "default" {
  assume_role_policy = data.aws_iam_policy_document.lambda.json

  description = "Allows Lambda Function to call AWS services on your behalf."
  name        = "lambda_exec"
  path        = "/"
}

data "aws_iam_policy_document" "lambda" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["lambda.amazonaws.com"]
      type        = "Service"
    }
  }
}


resource "aws_iam_role_policy" "default" {
  policy = data.aws_iam_policy_document.default.json

  role = aws_iam_role.default.id
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ses:*",
      "logs:*"
    ]

    resources = ["*"]
  }
}

resource "aws_lambda_function" "default" {
  environment {
    variables = {
      ENV_VAR1         = var.env_var1
      ENV_VAR2         = var.env_var2
    }
  }

  filename         = data.archive_file.default.output_path
  function_name    = "minimal_lambda_function"
  handler          = "lambda.handler"
  role             = aws_iam_role.default.arn
  runtime          = "python3.6"
  source_code_hash = data.archive_file.default.output_base64sha256
}

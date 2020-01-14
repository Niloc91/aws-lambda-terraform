provider "aws" {

  allowed_account_ids = [
    var.master_account_id,
  ]

  region  = var.region
  version = "~> 2.19.0"
}

module "master_lambda" {
  source = "../lambda"

  env_var1 = "ENV variable 1"
  env_var2 = "ENV variable 2"
}
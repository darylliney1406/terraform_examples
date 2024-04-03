terraform {
    backend "s3" {
      bucket = "subwave-labs-terraform"
      key = "infrastructure/terraform.tfstate"
      region = "eu-west-2"
    #   dynamodb_table = "subwave-labs-ddb"
    #   encrypt = true
    }
}
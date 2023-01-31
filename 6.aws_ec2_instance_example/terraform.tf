terraform {
  # variables cant be used here. As this is run before any block.
#   required_version = "1.0.0"
    required_version = ">=1.3"
  #   required_version = ">=1.5, <2.0.0"
  #   required_version = "-> 0.15.0" # this will run any version with 0.15.x but not 1.0

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.74.1"
    }
  }
}
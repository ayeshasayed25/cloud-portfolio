terraform {

required_providers {

aws = {

source = "hashicorp/aws"

version = "~> 5.0"

}

}

}


provider "aws" {

region = "ca-central-1"

}


resource "aws_s3_bucket" "portfolio_bucket" {

bucket = "ashiyana-cloud-portfolio-storage-2026"


tags = {

Name = "Cloud Portfolio Storage"

Environment = "Development"

}

}
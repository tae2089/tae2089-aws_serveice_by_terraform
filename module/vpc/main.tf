resource "aws_vpc" "terraform_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.alltag}_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "${var.alltag}-igw"
  }
}
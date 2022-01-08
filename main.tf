provider "aws" {
  region = "ap-northeast-2"
  shared_credentials_file = "/Users/imtaebin/.aws/credentials"
  profile = "terraform"
}

module "vpc" {
  source = "./module/vpc"

  vpc_cidr = var.vpc_cidr
  alltag   = var.alltag
}

module "public_subnet" {
  source = "./module/subnet"

  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  public_subnet_az   = data.aws_availability_zones.available.names["${var.public_subnet_az}"]
  is_public          = true
  alltag             = var.alltag
}

module "public_subnet_rtb_igw" {
  source = "./module/routetable"

  vpc_id    = module.vpc.vpc_id
  igw_id    = module.vpc.igw_id
  subnet_id = module.public_subnet.subnet_id
  alltag    = var.alltag
}

module "private_subnet" {
  source = "./module/subnet"

  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.private_subnet_cidr
  public_subnet_az   = data.aws_availability_zones.available.names["${var.private_subnet_az}"]
  is_public          = false
  alltag             = var.alltag
}

module "ssh_security"{
  source = "./module/security"
  vpc_id  = module.vpc.vpc_id
  from_port = 22
  to_port = 22
  name = "ssh"
  alltag = var.alltag
  protocol = var.protocol
  description = "this security is test security"
  cidr_blocks = ["0.0.0.0/0"]
}

# module "web_instance" {
#   source = "./module/ec2"
#   vpc_subnet_id = module.subnet.subnet_id

# }
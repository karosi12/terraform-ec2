provider "aws" {}


resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env-prefix}-vpc"
  }
}

module "myapp-subnet" {
  source = "./modules/subnet"
  vpc_id = aws_vpc.myapp-vpc.id
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone = var.avail_zone
  env-prefix = var.env-prefix
}

module "myapp-server" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id
  subnet_id = module.myapp-subnet.subnet.id
  avail_zone = var.avail_zone
  env-prefix = var.env-prefix
  instance_type = var.instance_type
  my-ip = var.my-ip
  image-name = var.image-name
  private_key_location = var.private_key_location
  public_key_location = var.public_key_location
}


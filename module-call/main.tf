module "vpc-peering-module" {
  source                = "../modules/vpc-peering"
  requester_vpc_id      = var.requester_vpc_id
  accepter_vpc_id       = var.accepter_vpc_id
  requester_region      = var.requester_region
  accepter_region       = var.accepter_region
  requester_peering_tag = var.requester_peering_tag
  accepter_peering_tag  = var.accepter_peering_tag

  providers = {
    aws.requester = aws.requester
    aws.accepter  = aws.accepter
  }
}

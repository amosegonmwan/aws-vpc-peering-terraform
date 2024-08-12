variable "requester_region" {
  description = "The region for the requester (custom VPC)"
  type        = string
}

variable "accepter_region" {
  description = "The region for the accepter (default VPC)"
  type        = string
}

variable "requester_vpc_id" {
  description = "The ID of the custom VPC to peer"
  type        = string
}

variable "accepter_vpc_id" {
  description = "The ID of the default VPC to peer"
  type        = string
}

variable "requester_peering_tag" {
  description = "The Name tag for the requester VPC peering connection"
  type        = string
}

variable "accepter_peering_tag" {
  description = "The Name tag for the accepter VPC peering connection"
  type        = string
}

# Requester's side of the connection
resource "aws_vpc_peering_connection" "peer" {
  provider      = aws.requester
  peer_owner_id = data.aws_caller_identity.accepter.account_id
  peer_region   = var.accepter_region
  vpc_id        = var.requester_vpc_id
  peer_vpc_id   = var.accepter_vpc_id
  auto_accept   = false

  tags = {
    Name = var.requester_peering_tag
  }
}

# Accepter's side of the connection
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = {
    Name = var.accepter_peering_tag
  }
}

# Module: ROUTE REQUESTOR
resource "aws_route" "requestor_vpc_peering" {
  provider                    = aws.requester
  count                       = length(data.aws_route_tables.requester.ids)
  route_table_id              = tolist(data.aws_route_tables.requester.ids)[count.index]
  destination_cidr_block      = data.aws_vpc.accepter.cidr_block
  vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
}

# Module: ROUTE ACCEPTOR
resource "aws_route" "acceptor_vpc_peering" {
  provider                    = aws.accepter
  count                       = length(data.aws_route_tables.accepter.ids)
  route_table_id              = tolist(data.aws_route_tables.accepter.ids)[count.index]
  destination_cidr_block      = data.aws_vpc.requester.cidr_block
  vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
}

data "aws_vpc" "requester" {
  provider = aws.requester
  id       = var.requester_vpc_id
}

data "aws_route_tables" "requester" {
  provider = aws.requester
  vpc_id   = var.requester_vpc_id
}

data "aws_vpc" "accepter" {
  provider = aws.accepter
  id       = var.accepter_vpc_id
}

data "aws_route_tables" "accepter" {
  provider = aws.accepter
  vpc_id   = var.accepter_vpc_id
}

data "aws_caller_identity" "accepter" {
  provider = aws.accepter
}

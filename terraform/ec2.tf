resource "aws_ec2_transit_gateway" "main" {
  count       = var.environment == var.tgw_owner_environment ? 1 : 0
  description = "TGW for ${var.environment}"
}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  count              = var.environment != var.tgw_owner_environment ? 1 : 0
  vpc_id             = aws_vpc.main.id
  subnet_ids         = [for s in aws_subnet.private : s.id]
  transit_gateway_id = var.shared_tgw_id

  tags = {
    Name = "TGW-Attachment-${var.environment}"
  }
}

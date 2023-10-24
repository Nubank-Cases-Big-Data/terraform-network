resource "aws_ram_resource_share" "tgw_resource_share" {
  count                     = var.environment == var.tgw_owner_environment ? 1 : 0
  name                      = var.tgw_resource_share_name
  allow_external_principals = true

  tags = {
    Name = var.tgw_resource_share_name
  }
}

resource "aws_ram_resource_association" "tgw_resource_association" {
  count              = var.environment == var.tgw_owner_environment ? 1 : 0
  resource_arn       = aws_ec2_transit_gateway.main[0].arn
  resource_share_arn = aws_ram_resource_share.tgw_resource_share[0].arn
}

resource "aws_ram_principal_association" "tgw_principal_association" {
  count              = var.environment == var.tgw_owner_environment ? 1 : 0
  principal          = var.secondary_account_id
  resource_share_arn = aws_ram_resource_share.tgw_resource_share[0].arn
}

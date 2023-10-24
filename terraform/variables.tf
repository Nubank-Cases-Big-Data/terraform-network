variable "environment" {
  description = "Specify the deployment environment. This variable allows you to choose the environment where you want to deploy the infrastructure, which can be useful for managing multiple environments such as development, testing, and production."
  type        = string
  default     = "prd"
}

variable "tgw_owner_environment" {
  description = "Environment that is the owner of the Transit Gateway."
  type        = string
  default     = "prd"
}

variable "shared_tgw_id" {
  description = "ARN of the Transit Gateway shared by the owner account."
  type        = string
  default     = ""
}

variable "tgw_resource_share_name" {
  description = "Name for the Transit Gateway resource share in RAM"
  default     = "TGW-Resource-Share"
}

variable "secondary_account_id" {
  description = "AWS secondary account ID that will be granted access to the Transit Gateway"
  default     = ""
}

variable "environment_cidrs" {
  default = {
    "prd" = "10.1.0.0/16"
    "dta" = "10.2.0.0/16"
  }
}

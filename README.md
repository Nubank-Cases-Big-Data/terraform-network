# Bootstrap Network Configurations

This repository aims to centralize all network configurations of the organization, including Virtual Private Cloud (VPC) setup, connectivity between accounts via Transit Gateway, Resource Access Manager (RAM) settings, and more using Terraform. It ensures a structured approach to managing and scaling your network infrastructure across multiple AWS accounts.

## Primary Objectives

1. **VPC Configuration**: Define and manage Virtual Private Clouds to isolate and provision resources in the cloud.
2. **Transit Gateway Setup**: Enable interconnectivity between multiple VPCs and on-premises networks across multiple accounts.
3. **RAM Configuration**: Share resources across accounts using the AWS Resource Access Manager.

## Setting Up the Network Infrastructure

Proper configuration is vital for ensuring network security, scalability, and connectivity. Follow the steps below to deploy your network configurations using Terraform.

### Prerequisites

#### Installing AWS Vault

If interacting with AWS resources, follow the instructions on the [AWS Vault GitHub page](https://github.com/99designs/aws-vault).

#### Installing TFEnv

For handling multiple Terraform versions, utilize TFEnv. Instructions are available on the [TFEnv GitHub page](https://github.com/tfutils/tfenv).

### Configuring AWS Vault

To integrate with AWS, configure AWS Vault by updating the AWS config file, usually located at `~/.aws/config`:

```plaintext
[profile <environment-name>]
sso_start_url = <your-sso-url>
sso_region = <your-region>
sso_account_id = <your-account-id>
sso_role_name = <your-role-name>
region = <your-region>
output = json
```

*Note: Replace the placeholders (< >) with correct values.*

Authenticate with your AWS account:

```bash
aws-vault login <environment-name>
```

### 1. Initializing Terraform

Change to the directory with Terraform files and run the initialization:

```bash
cd terraform
terraform init
```

### 2. Reviewing and Implementing Changes

Preview the potential changes and execute them:

```bash
terraform plan -var-file=<environment-name>/variables.tfvars
terraform apply -var-file=<environment-name>/variables.tfvars -auto-approve
cd ..
```

### 3. Examining Configured Resources

After deploying, inspect the created VPCs, Transit Gateways, RAM configurations, and other network-related resources.

### 4. Applying to Other Environments

For different environment setups:

1. Authenticate to your AWS account:

```bash
aws-vault login <other-environment-name>
```

2. Clean the temporary Terraform files:

```bash
rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
```

3. Re-run steps 1 and 2, replacing the environment name where necessary.

### 5. Configuring GitHub Secrets for CI/CD

When integrating with CI/CD pipelines, set up the GitHub Secrets for necessary credentials:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

Note:

Retrieve these credentials from your AWS Console or any secrets management service in use. Make sure to set these secrets in your GitHub repository before committing any changes.

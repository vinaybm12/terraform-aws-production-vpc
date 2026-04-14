
# terraform-aws-production-vpc

This project provisions a production-style AWS VPC architecture using Terraform, following Infrastructure as Code (IaC) principles to automate secure and repeatable cloud infrastructure deployment.

It demonstrates how to build a segmented AWS network with public and private subnets, controlled internet access, and secure administrative connectivity using Terraform.

## Project Overview

The infrastructure includes:

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Security Groups
- Bastion Host in Public Subnet
- Private EC2 Instance in Private Subnet

## Architecture Summary

This setup follows a common real-world AWS networking pattern:

- Public subnet hosts a bastion instance for administrative access
- Private subnet hosts internal workloads with no direct public exposure
- NAT Gateway enables outbound internet access for private resources
- Internet Gateway handles inbound/outbound traffic for public resources

## Terraform File Structure

provider.tf          # AWS provider configuration
variables.tf         # Input variables
vpc.tf               # VPC creation
subnets.tf           # Public and private subnets
gateway.tf           # Internet and NAT gateways
route_table.tf       # Route table configuration
security_grp.tf      # Security groups
public_instance.tf   # Bastion host EC2
private_instance.tf  # Private EC2 instance
eip.tf               # Elastic IP allocation
output.tf            # Output values


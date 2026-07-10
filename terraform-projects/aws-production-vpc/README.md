# AWS Production VPC

## Overview

This project provisions a production-style AWS Virtual Private Cloud (VPC) using Terraform.

## Services

- AWS VPC
- Terraform
- AWS Provider

## Features

- Custom CIDR block
- DNS Hostnames
- DNS Support
- Infrastructure as Code
- Version-controlled Terraform configuration

## Next Steps

- Internet Gateway
- Public Subnets
- Private Subnets
- Route Tables
- NAT Gateway
- Security Groups
- EC2

## Compute Layer

The infrastructure includes:

- Bastion Host EC2 instance deployed in public subnet
- Private Application EC2 instance deployed in private subnet
- Security groups implementing restricted SSH access
- Terraform-managed EC2 provisioning

## Security Design

- Bastion host allows controlled administrative access
- Private instances are not directly accessible from the internet
- Security groups follow least privilege principles

## NAT Gateway Implementation

Implemented secure outbound internet access for private subnet resources.

Architecture:

Private EC2
      |
Private Route Table
      |
NAT Gateway
      |
Internet Gateway
      |
Internet

Benefits:

- Private instances remain inaccessible from the internet
- Enables software updates and package installation
- Improves security posture

## Day 10 - High Availability Layer

Implemented:

- Application Load Balancer
- Target Group
- Launch Template
- Auto Scaling Group
- EC2 Health Checks

# Architecture Benefits:

- Automatic instance replacement
- Traffic distribution
- Improved application availability
- Self-healing infrastructure
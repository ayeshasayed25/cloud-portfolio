# AWS Highly Available Web Application Infrastructure


## Project Overview

Designed a production-style AWS cloud infrastructure architecture focused on availability, scalability, security, and monitoring.

The project demonstrates Cloud Infrastructure and Site Reliability Engineering practices.


## Business Scenario

A company requires a reliable web application platform that can handle increased traffic while maintaining availability during infrastructure failures.


## Architecture Components

The solution includes:

- Amazon VPC
- Public and Private Subnets
- Application Load Balancer
- EC2 Instances
- Auto Scaling Group
- Amazon RDS Database
- IAM Roles
- Security Groups
- CloudWatch Monitoring


## High Availability Design

The architecture follows AWS reliability principles:

- Multi Availability Zone deployment
- Load-balanced application servers
- Private database layer
- Automated monitoring


## Security Implementation

Security controls include:

- Network segmentation
- Security Groups
- IAM least privilege access
- Private database access
- Controlled inbound traffic


## Monitoring and Observability

Monitoring approach:

- CloudWatch metrics
- Application health checks
- Infrastructure alerts


## SRE Practices Demonstrated

- Reliability engineering
- Fault tolerance
- Monitoring and alerting
- Infrastructure documentation
- Incident prevention


## AWS Services Used

| AWS Service | Purpose |
|---|---|
| VPC | Network isolation |
| EC2 | Application servers |
| ALB | Traffic distribution |
| RDS | Database |
| IAM | Access management |
| CloudWatch | Monitoring |
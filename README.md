# Terraform AWS Modules
<img width="862" height="497" alt="image" src="https://github.com/user-attachments/assets/d4fa479e-b36d-481d-8d2b-357faea4d966" />

## Overview

This project demonstrates how to provision AWS infrastructure using **Terraform Modules**.

The goal is to demonstrate modular infrastructure deployment by creating and managing AWS EC2 instances through reusable Terraform modules.

Instead of defining all infrastructure resources in a single configuration, this project separates infrastructure components into individual modules, making the configuration easier to maintain, reuse, and scale.

## Architecture

The project uses two separate Terraform modules to provision AWS EC2 instances.

- **Module 1:** Provisions an EC2 instance using the first reusable module.
- **Module 2:** Provisions another EC2 instance using the second reusable module.
- **Root Configuration:** Calls both modules and passes shared variables.
- **Outputs:** Exposes the public IP addresses of both instances.

## Project Structure

```text
Terraform-Modules/
│
├── module-1/
│   └── Terraform module files
│
├── module-2/
│   └── Terraform module files
│
├── main.tf
├── var.tf
├── outputs.tf
├── .gitignore
└── README.md
```

## Technologies Used

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS | Cloud infrastructure provider |
| Amazon EC2 | Virtual machine instances |
| Terraform Modules | Reusable infrastructure components |
| AWS Provider | Communication with AWS services |


## Retrieve the Outputs

After successful deployment, Terraform displays the public IP addresses of the two EC2 instances.

The project exposes:

- `public_ip_mod1`
- `public_ip_mod2`

These outputs allow you to identify the public IP address associated with each module.

## Terraform Configuration

### Provider Configuration

The root configuration uses:

- Terraform version: `~> 1.15.0`
- AWS Provider: `~> 6.0`
- AWS Region: `eu-west-2`

## Cleaning Up Resources

To avoid unnecessary AWS charges, destroy the infrastructure when it is no longer required.
- Run "terraform destroy"
- Confirm the operation when prompted.

## Key Learning Outcomes

Through this project, I demonstrate practical experience with:

- Infrastructure as Code (IaC).
- Terraform module creation and implementation.
- Reusable infrastructure components.
- AWS provider configuration.
- EC2 instance provisioning.
- Terraform input variables and outputs.
- Managing infrastructure through Terraform CLI commands.
- Deploying multiple infrastructure components from a single root configuration.

## Future Improvements

Potential enhancements include:

- Implementing remote Terraform state using Amazon S3.
- Adding state locking.
- Creating reusable VPC and networking modules.
- Implementing security groups and SSH access controls.
- Introducing Terraform workspaces for multiple environments.
- Integrating Terraform with GitHub Actions for CI/CD.
- Adding module documentation and versioning.



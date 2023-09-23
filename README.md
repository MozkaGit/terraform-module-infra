# Terraform AWS Infrastructure

This project uses Terraform to deploy an infrastructure on AWS.

## Project Goal

Automatically deploy resources for hosting nginx on AWS, including EC2 instances, EBS volumes, elastic IP addresses and security groups.

## Prerequisites

Before getting started, ensure that you have the following tools installed on your machine:

- An AWS account with access keys and permissions to deploy resources.
- Terraform installed locally on your development machine.
- AWS CLI in order to configure credentials with `aws configure` command.

## Components

- **Provider AWS**: This block configures the AWS region and credentials file to be used.
  
- **Backend S3**: Used to store Terraform status in an S3 bucket.

- **EC2 Module**: Deploys an EC2 instance with a specific instance type and security group.

- **EBS module**: Creates an EBS volume of specified size and attaches it to the EC2 instance.

- **EIP module**: Associates an elastic IP address with the EC2 instance.

- **SG module**: Creates a security group.

## Usage

To deploy the configuration, follow these steps:

1. Clone this repository to your local machine.
2. Navigato to the project directory.
3. Run the command `terraform init` to initialize Terraform and download the required providers.
4. Run the command `terraform apply` to create the ressources on AWS.
5. The deployment process may take a few moments. Once completed, you'll see the URL of your instance generated in `ip_ec2.txt` file.

Make sure you have configured your AWS credentials and adjust the settings with `aws configure` as required before running `terraform apply`.

## Cleanup

To avoid unnecessary charges, make sure to run `terraform destroy` in order to destroy the created resources after finishing your tests.

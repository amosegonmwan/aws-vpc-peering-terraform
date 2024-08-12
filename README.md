# AWS VPC Peering Connection Terraform Module

This repository contains a Terraform module designed to establish a VPC peering connection between two VPCs located in different AWS regions. The module handles the creation and management of the VPC peering connection, configuration of route tables for both VPCs, and automatic acceptance of the connection by the accepter.

## Directory Structure
The project is structured as follows:

- **modules/vpc-peering/:** Contains the Terraform files defining the VPC peering connection, route table configurations, and data sources for both the requester and accepter VPCs.
- **module-call/:** Includes the main Terraform files for invoking the VPC peering module, configuring providers for the requester and accepter, and defining necessary variables and their values.

## Features
- **Cross-Region VPC Peering:** Establish a VPC peering connection between two VPCs in different regions.
- **Automatic Acceptance:** Automatically accept the VPC peering connection on the accepter's side.
- **Route Table Configuration:** Configure route tables for both the requester and accepter VPCs to allow traffic between them.
- **Custom Tags:** Apply custom tags to both sides of the peering connection for easier identification.

## Usage
1. **Initialize the Module:**

Use the vpc-peering module to establish the peering connection between the two VPCs by defining the required variables and invoking the module in your Terraform configuration.

2. **Configure AWS Providers:**
Define the AWS providers for both the requester and accepter VPCs. The providers are configured using the appropriate AWS regions for each VPC.

3. **Define Variables:**
Specify the necessary variables such as the VPC IDs, region, and custom tags for both the requester and accepter VPCs. These variables are used to customize the peering connection.

4. **Provide Values:**
Assign values to the defined variables in a .tfvars file. This file contains the actual AWS region, VPC IDs, and custom tag names for the peering connection.

5. **Apply the Configuration:**
Use Terraform commands to initialize, plan, and apply the configuration, thereby creating the VPC peering connection and configuring route tables as specified.
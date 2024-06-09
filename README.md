# AWS Static Website with S3 and Route 53 using Terraform

 Setting up a static website hosted on AWS S3 with a custom domain using Route 53.

## Prerequisites

1. **AWS Account:** Ensure you have an AWS account.
2. **Terraform Installed:** Ensure you have Terraform installed on your machine.
3. **Domain Name:** You must have a registered domain name that you can manage through Route 53.

## Steps

1. **Create an S3 Bucket for your static website**
2. **Configure the bucket for static website hosting**
3. **Upload your website content to the bucket**
4. **Create a Route 53 hosted zone for your domain**
5. **Create an alias record in Route 53 to point to your S3 bucket**

## Terraform Configuration

Create a directory for your Terraform configuration files and navigate to it:

```sh
mkdir  myS3staticwebsite-terraform
cd  myS3staticwebsite-terraform
```
![Screenshot 2024-06-07 150543](https://github.com/shivxm03/Terraform-AWS-S3StaticWebsite/assets/157244434/b036aa34-7b5b-4657-b3c3-eb4e7cc50ee6)


# Moon Lander AWS Infrastructure

This Terraform configuration sets up the complete AWS infrastructure for hosting the Moon Lander game.

## Architecture

- **S3 Bucket**: Static website hosting with versioning and encryption
- **CloudFront**: Global CDN with custom caching rules
- **Route 53**: DNS management and certificate validation
- **ACM Certificate**: SSL/TLS certificate for HTTPS

## Prerequisites

1. AWS CLI configured with appropriate permissions
2. Terraform installed (>= 1.0)
3. Domain name registered and Route 53 hosted zone created

## Setup Instructions

1. **Copy configuration file:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Edit terraform.tfvars with your values:**
   ```hcl
   domain_name = "moonlander.yourdomain.com"
   zone_id     = "Z1234567890ABC"  # Your Route 53 hosted zone ID
   ```

3. **Initialize Terraform:**
   ```bash
   cd terraform
   terraform init
   ```

4. **Plan the deployment:**
   ```bash
   terraform plan
   ```

5. **Apply the configuration:**
   ```bash
   terraform apply
   ```

6. **Note the outputs:**
   After successful deployment, note the S3 bucket name and CloudFront distribution ID for GitHub Actions secrets.

## GitHub Actions Secrets

Add these secrets to your GitHub repository:

- `AWS_ACCESS_KEY_ID`: AWS access key with S3 and CloudFront permissions
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key
- `S3_BUCKET_NAME`: Output from Terraform (s3_bucket_name)
- `CLOUDFRONT_DISTRIBUTION_ID`: Output from Terraform (cloudfront_distribution_id)

## Permissions Required

The AWS user/role needs these permissions:
- S3: Full access to the created bucket
- CloudFront: CreateInvalidation
- Route 53: Read access to the hosted zone

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

**Note:** Make sure to empty the S3 bucket before destroying if it contains files.
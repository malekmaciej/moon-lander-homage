#!/bin/bash

# Moon Lander Deployment Validation Script

set -e

echo "🚀 Moon Lander Deployment Validation"
echo "===================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to print status
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
    fi
}

# Check prerequisites
echo -e "${YELLOW}Checking prerequisites...${NC}"

command_exists git
print_status $? "Git is installed"

command_exists terraform
print_status $? "Terraform is installed"

command_exists aws
print_status $? "AWS CLI is installed"

# Check if we're in a git repository
git status >/dev/null 2>&1
print_status $? "In a Git repository"

# Check required files
echo -e "\n${YELLOW}Checking required files...${NC}"

[ -f "moon-lander.html" ]
print_status $? "moon-lander.html exists"

[ -f "kiro-logo.png" ]
print_status $? "kiro-logo.png exists"

[ -f ".github/workflows/deploy.yml" ]
print_status $? "GitHub Actions workflow exists"

[ -f "terraform/main.tf" ]
print_status $? "Terraform configuration exists"

# Check file sizes (basic validation)
echo -e "\n${YELLOW}Validating file sizes...${NC}"

html_size=$(wc -c < "moon-lander.html")
if [ $html_size -gt 1000 ]; then
    print_status 0 "moon-lander.html has content ($html_size bytes)"
else
    print_status 1 "moon-lander.html seems too small ($html_size bytes)"
fi

png_size=$(wc -c < "kiro-logo.png")
if [ $png_size -gt 100 ]; then
    print_status 0 "kiro-logo.png has content ($png_size bytes)"
else
    print_status 1 "kiro-logo.png seems too small ($png_size bytes)"
fi

# Check HTML syntax (basic)
echo -e "\n${YELLOW}Basic HTML validation...${NC}"

if grep -q "<!DOCTYPE html>" moon-lander.html; then
    print_status 0 "HTML has DOCTYPE declaration"
else
    print_status 1 "HTML missing DOCTYPE declaration"
fi

if grep -q "<canvas" moon-lander.html; then
    print_status 0 "HTML contains canvas element"
else
    print_status 1 "HTML missing canvas element"
fi

if grep -q "kiro-logo.png" moon-lander.html; then
    print_status 0 "HTML references kiro-logo.png"
else
    print_status 1 "HTML doesn't reference kiro-logo.png"
fi

# Check AWS configuration (if available)
echo -e "\n${YELLOW}Checking AWS configuration...${NC}"

if aws sts get-caller-identity >/dev/null 2>&1; then
    print_status 0 "AWS credentials configured"
    aws_account=$(aws sts get-caller-identity --query Account --output text)
    echo -e "  Account: ${aws_account}"
else
    print_status 1 "AWS credentials not configured"
fi

# Check Terraform configuration
echo -e "\n${YELLOW}Validating Terraform...${NC}"

cd terraform
if terraform validate >/dev/null 2>&1; then
    print_status 0 "Terraform configuration is valid"
else
    print_status 1 "Terraform configuration has errors"
fi

if [ -f "terraform.tfvars" ]; then
    print_status 0 "terraform.tfvars exists"
else
    print_status 1 "terraform.tfvars missing (copy from terraform.tfvars.example)"
fi

cd ..

echo -e "\n${YELLOW}Deployment readiness summary:${NC}"
echo "1. Configure terraform.tfvars with your domain and zone ID"
echo "2. Run: cd terraform && terraform init && terraform apply"
echo "3. Add GitHub secrets: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, S3_BUCKET_NAME, CLOUDFRONT_DISTRIBUTION_ID"
echo "4. Push to main branch to trigger deployment"

echo -e "\n${GREEN}🎮 Ready to deploy Moon Lander!${NC}"
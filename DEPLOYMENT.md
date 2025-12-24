# Moon Lander Deployment Guide

## Quick Start Deployment

### Option 1: Manual AWS Setup (Recommended for Learning)

1. **Set up AWS Infrastructure:**
   ```bash
   cd terraform
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your domain and zone ID
   terraform init
   terraform plan
   terraform apply
   ```

2. **Configure GitHub Secrets:**
   Go to your GitHub repository → Settings → Secrets and variables → Actions
   
   Add these secrets:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key
   - `S3_BUCKET_NAME`: From Terraform output
   - `CLOUDFRONT_DISTRIBUTION_ID`: From Terraform output

3. **Deploy via GitHub Actions:**
   ```bash
   git add .
   git commit -m "Add AWS infrastructure and deployment pipeline"
   git push origin main
   ```

### Option 2: Quick Test with Netlify (Alternative)

If you want to test quickly without AWS setup:

1. **Fork/Clone this repository**
2. **Connect to Netlify:**
   - Go to [netlify.com](https://netlify.com)
   - Click "New site from Git"
   - Connect your GitHub repository
   - Set build command: (leave empty)
   - Set publish directory: `/`
   - Deploy!

3. **Custom Domain (Optional):**
   - In Netlify dashboard → Domain settings
   - Add your custom domain
   - Follow DNS configuration instructions

## File Structure for Deployment

The deployment includes these files:
```
/
├── moon-lander.html     # Main game file (entry point)
├── kiro-logo.png        # Game asset
├── .github/workflows/   # CI/CD pipeline
├── terraform/           # AWS infrastructure
└── DEPLOYMENT.md        # This file
```

## Deployment Features

✅ **Automatic SSL/HTTPS**  
✅ **Global CDN distribution**  
✅ **Optimized caching (5min for HTML, 30 days for images)**  
✅ **Gzip/Brotli compression**  
✅ **Zero-downtime deployments**  
✅ **Automatic cache invalidation**  
✅ **Security headers**  

## Performance Optimizations

- **HTML caching**: 5 minutes (allows quick updates)
- **Image caching**: 30 days (static assets)
- **Compression**: Enabled for all text files
- **HTTP/2**: Enabled via CloudFront
- **Edge locations**: Global distribution

## Monitoring

After deployment, monitor:
- **CloudWatch**: AWS metrics and logs
- **GitHub Actions**: Deployment status
- **Browser DevTools**: Core Web Vitals
- **Lighthouse**: Performance scores

## Troubleshooting

**Deployment fails:**
- Check GitHub Actions logs
- Verify AWS credentials and permissions
- Ensure S3 bucket name is unique

**Site not loading:**
- Check CloudFront distribution status
- Verify DNS propagation (can take up to 48 hours)
- Check browser cache (try incognito mode)

**Performance issues:**
- Run Lighthouse audit
- Check CloudFront cache hit ratio
- Verify compression is enabled

## Next Steps

After successful deployment:
1. Set up monitoring and alerts
2. Configure custom domain
3. Add performance tracking
4. Implement security headers
5. Set up staging environment

## Support

- AWS Documentation: [docs.aws.amazon.com](https://docs.aws.amazon.com)
- Terraform Documentation: [terraform.io](https://terraform.io)
- GitHub Actions: [docs.github.com/actions](https://docs.github.com/actions)
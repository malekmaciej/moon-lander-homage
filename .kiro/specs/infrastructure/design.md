# Infrastructure Design

## Architecture Overview

```
[Developer] → [Git Repository] → [CI/CD Pipeline] → [CDN] → [Users]
```

## Components

### Static Hosting
- **Primary**: AWS S3 + CloudFront

### CI/CD Pipeline
- **Trigger**: Push to main branch
- **Steps**:
  1. Build validation (if applicable)
  2. Deploy to staging
  3. Run tests
  4. Deploy to production
  5. Invalidate CDN cache

### Domain & SSL
- Custom domain configuration
- Automatic SSL certificate management
- HTTP to HTTPS redirects

## Technology Choices

### AWS
- **S3**: Static file hosting
- **CloudFront**: Global CDN
- **Route 53**: DNS management (zoneid and domain name will provided as variables)
- **Authentication**: IAM, Cognito, Sigin with email, SES
- **Security**: WAF, Shield
- **CodePipeline**: CI
- **CodeBuild**: CI
- **CodeDeploy**: CD

## Deployment Strategy
- **Recreate Deployment** - no need to worry about downtime

## Monitoring & Observability
- **Uptime**: AWS CloudWatch
- **Analytics**: CloudWatch RUM
- **Logging**: CloudWatch Logs
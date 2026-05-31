# terraform-projects-ecs-rds-alb-waf

Three-tier AWS environment built with Terraform. Containerized app running on ECS 
Fargate, MySQL backend on RDS Multi-AZ, traffic routed through an ALB with WAF 
in front. Everything lives in private subnets except the load balancer.

## Architecture

Internet → WAFv2 → ALB → ECS Fargate (3 tasks) → RDS MySQL Multi-AZ

VPC across 3 AZs. Public subnets for the ALB, private for ECS, isolated for RDS.
NAT Gateways for outbound. VPC Endpoints for S3 and ECR to avoid routing through
the public internet.

## CI/CD

 added terraform fmt and terraform validate. .github works

## Modules

- `vpc` — subnets, route tables, NAT gateways, VPC endpoints
- `security-groups` — per-tier rules, each layer only accepts from the one above
- `alb` — load balancer, listener rules, S3 access logging
- `ecs` — cluster, task definitions, Fargate service
- `rds` — MySQL, Multi-AZ, private subnet group
- `s3` — encrypted logging bucket
- `secrets` — RDS credentials in Secrets Manager, not hardcoded
- `waf` — AWS Managed Rules (Core Rule Set, Known Bad Inputs)

## Usage

```bash
terraform init
terraform plan -var-file="env/dev/terraform.tfvars"
terraform apply -var-file="env/dev/terraform.tfvars"
```

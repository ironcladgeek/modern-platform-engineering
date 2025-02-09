terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

locals {
  cluster_name = "${var.project}-${var.environment}-cluster"

  tags = {
    "Environment" = var.environment
    "Project"     = var.project
    "ManagedBy"   = "terraform"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                   = local.cluster_name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  # IAM roles
  create_iam_role = false
  iam_role_arn    = var.cluster_role_arn

  # Managed node groups
  eks_managed_node_groups = {
    main = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_type = "t3.nano"
      capacity_type = "ON_DEMAND"

      create_iam_role = false
      iam_role_arn    = var.node_role_arn

      labels = {
        Environment = var.environment
        NodeGroup   = "main"
      }

      tags = local.tags
    }
  }

  # Enable OIDC provider for service accounts
  enable_irsa = true

  tags = local.tags
}

# Configure kubectl
resource "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = aws_eks_cluster_auth.this.token
}

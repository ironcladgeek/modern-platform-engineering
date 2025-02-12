# Modern Platform Engineering Stack

A comprehensive platform engineering project demonstrating the implementation of an Internal Developer Platform (IDP) using modern DevOps practices and tools.

## Project Overview

This project implements a production-ready Internal Developer Platform that showcases:

- Infrastructure as Code (IaC) with Terraform
- Kubernetes cluster management with AWS EKS
- GitOps practices using ArgoCD
- CI/CD pipelines with GitHub Actions
- Developer environment standardization using Nix, direnv, and devenv
- Platform engineering best practices and patterns

## Repository Structure

```
.
├── .github/
│   └── workflows/         # GitHub Actions CI/CD workflows
├── infra/
│   ├── argocd/            # ArgoCD installation and configuration
│   ├── eks/               # EKS cluster configuration
│   ├── iam/               # Identity management configuration
│   └── vpc/               # Networking infrastructure components
├── kubernetes/
│   ├── applications/      # Application manifests
│   └── platform/          # Platform service manifests
├── nix/
│   ├── devenv.nix         # Development environment configuration
│   └── shell.nix          # Nix shell configuration
└── docs/
    ├── architecture/      # Architecture documentation
    ├── runbooks/          # Operational runbooks
    └── user-guides/       # User guides for developers
```

## Features

- **Infrastructure as Code**
  - AWS EKS cluster provisioning with Terraform
  - Multi-environment support (dev, staging, prod)
  - Infrastructure security best practices

- **GitOps Implementation**
  - ArgoCD for declarative continuous delivery
  - Git as single source of truth
  - Automated sync and drift detection

- **Developer Experience**
  - Reproducible development environments with Nix
  - Standardized tooling across team members
  - Self-service capabilities for developers

- **CI/CD Pipeline**
  - Automated testing and validation
  - Infrastructure change management
  - Application deployment automation

## Getting Started

### Prerequisites

- AWS Account with appropriate permissions
- GitHub account
- Basic knowledge of Kubernetes, Terraform, and AWS
- Nix package manager installed

### Initial Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/ironcladgeek/modern-platform-engineering
   cd modern-platform-engineering
   ```

2. Initialize development environment:
   ```bash
   direnv allow
   ```

3. Configure AWS credentials:
   ```bash
   aws configure
   ```

4. Initialize Terraform:
   ```bash
   cd infra
   terraform init
   ```

## Development Workflow

1. Create a new feature branch
2. Make changes to infrastructure code
3. Run automated tests locally
4. Create a pull request
5. Automated CI/CD pipeline validates changes
6. Changes are applied through GitOps workflow

## Implementation Plan

### Phase 1: Foundation
- Set up base AWS infrastructure with Terraform
- Configure GitHub repository and initial CI/CD
- Implement Nix development environment

### Phase 2: Kubernetes Platform
- Deploy EKS cluster
- Install and configure ArgoCD
- Set up monitoring and logging

### Phase 3: Developer Experience
- Implement self-service capabilities
- Create documentation and runbooks
- Set up development workflows

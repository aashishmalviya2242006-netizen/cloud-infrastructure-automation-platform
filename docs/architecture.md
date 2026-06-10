# Project Overview

This project is designed to automate cloud infrastructure provisioning, security validation, deployment, and monitoring.

Instead of manually creating cloud resources from the AWS Console, everything will be managed using code and automation tools.

---

## High-Level Flow

Developer
↓
GitHub
↓
Jenkins
↓
Terraform Validation
↓
Security Scanning
↓
Terraform Plan
↓
Terraform Apply
↓
AWS Infrastructure
↓
Docker Deployment
↓
Monitoring

---

## Detailed Workflow

### Step 1 - Developer

The developer writes or updates infrastructure code.

Example:

* Create VPC
* Create Subnets
* Create EC2 Instance
* Create Security Groups

All changes are stored in GitHub.

---

### Step 2 - GitHub

GitHub acts as the central source of truth.

Benefits:

* Version control
* Change tracking
* Collaboration
* Backup

---

### Step 3 - Jenkins

Jenkins automates the entire process.

Tasks:

* Pull code from GitHub
* Run validation
* Run security checks
* Execute Terraform commands

---

### Step 4 - Terraform Validation

Terraform checks whether the configuration is correct.

Example:

terraform validate

This helps detect syntax errors before deployment.

---

### Step 5 - Security Scanning

Security tools check for mistakes.

Tools:

* Checkov
* tfsec
* Trivy

Examples of issues:

* Open security groups
* Weak configurations
* Vulnerabilities

---

### Step 6 - Terraform Plan

Terraform shows what changes will happen.

Example:

* Create VPC
* Create EC2
* Create Security Group

This step helps avoid unexpected changes.

---

### Step 7 - Terraform Apply

Terraform creates resources automatically.

Examples:

* VPC
* Subnets
* EC2 Instances
* Security Groups

---

### Step 8 - Docker Deployment

Applications can be deployed using Docker containers.

Benefits:

* Consistent environment
* Easy deployment
* Portability

---

### Step 9 - Monitoring

Infrastructure and applications are monitored.

Tools:

* Prometheus
* Grafana

Metrics:

* CPU Usage
* Memory Usage
* Network Usage
* System Health

---

## Final Architecture Diagram

Developer
↓
GitHub
↓
Jenkins
↓
Terraform Validate
↓
Checkov
↓
tfsec
↓
Terraform Plan
↓
Terraform Apply
↓
AWS Infrastructure
↓
Docker
↓
Prometheus
↓
Grafana

---

## Main Learning Areas

This project will help me learn:

* Linux
* Git & GitHub
* Terraform
* AWS
* Jenkins
* Docker
* DevSecOps
* Monitoring
* Infrastructure Automation


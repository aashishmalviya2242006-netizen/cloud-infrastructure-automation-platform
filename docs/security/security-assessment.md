# Security Assessment Report

## Project

Cloud Infrastructure Automation Platform

## Assessment Date

June 2026

---

## Objective

The goal of this assessment was to take a closer look at the security of our Terraform-based AWS infrastructure and identify any potential risks before moving forward with deployment.

---

## Security Tools Used

### Checkov

Checkov was used to scan our Terraform configurations for security issues related to Infrastructure as Code (IaC).

### tfsec

tfsec was used to analyze the Terraform setup and ensure it follows security best practices.

---

## Findings Summary

### Checkov Results

* Passed Checks: 9
* Failed Checks: 12

### tfsec Results

* Passed Checks: 8
* Critical Findings: 4
* High Findings: 1
* Medium Findings: 1
* Low Findings: 1

---

## Security Improvement Implemented

### IMDSv2 Enforcement

**Issue:**
The EC2 instance was not configured to require IMDSv2 authentication tokens.

**Risk:**
Without this requirement, attackers could potentially exploit the Instance Metadata Service to access sensitive information.

**Remediation:**
We updated the Terraform configuration to enforce IMDSv2:

metadata_options {
http_tokens = "required"
}

**Result:**
After applying this change and rescanning with tfsec, the high-severity issue related to IMDS was resolved.

---

## Findings Deferred for Future Phases

### Security Group Open to Internet

**Current Status:**
SSH, HTTP, and HTTPS access are currently open to the public.

**Reason Deferred:**
Since this project is still in a learning and development phase, public access is needed for testing and management.

**Future Improvement:**
Limit SSH access to trusted IP addresses and tighten network security rules.

---

### EBS Encryption

**Current Status:**
The root EBS volume is not encrypted.

**Reason Deferred:**
Enabling encryption would require recreating the existing EC2 instance.

**Future Improvement:**
Ensure encryption is enabled when provisioning new infrastructure.

---

### VPC Flow Logs

**Current Status:**
VPC Flow Logs are not enabled.

**Reason Deferred:**
This feature is planned for a later phase focused on monitoring.

**Future Improvement:**
Enable VPC Flow Logs and integrate them with logging and monitoring tools.

---

## Conclusion

Security scanning has been successfully integrated into the Terraform workflow using Checkov and tfsec.

We reviewed the infrastructure, identified key issues, and addressed the most important ones. Additional improvements are planned for future phases as the project continues to evolve.

# 🔐 Checkov DevSecOps Lab: Securing Terraform in CI/CD

## 📌 Overview
This project demonstrates how to integrate Infrastructure-as-Code (IaC) security into a CI/CD pipeline using **Checkov** and **GitHub Actions**.

The goal is to simulate a real-world DevSecOps workflow:
- Introduce insecure Terraform configurations
- Detect vulnerabilities using automated scanning
- Remediate high-risk issues
- Document remaining risks with proper analysis

---

## 🏗️ Architecture

Developer → GitHub Repo → GitHub Actions → Checkov Scan → Pass/Fail Pipeline


- Terraform code is scanned on every push
- Security issues cause the pipeline to fail
- Remediation is validated through subsequent pipeline runs

---

## 📁 Repository Structure

checkov-devsecops-lab/
├── terraform/
│ └── main.tf
├── .github/workflows/
│ └── checkov.yml
├── docs/
│ └── findings.md
└── README.md


---

## ⚙️ Technologies Used

- Terraform (Infrastructure as Code)
- Checkov (IaC Security Scanning)
- GitHub Actions (CI/CD)
- AWS (S3, Security Groups, KMS)

---

## 🚨 Initial Security Findings

Initial Checkov scan:

- ❌ Failed checks: 14
- Issues included:
  - Public S3 exposure
  - Open security groups (`0.0.0.0/0`)
  - No encryption at rest
  - No logging or versioning

---

## 🛠️ Remediation Steps

The following high-risk issues were remediated:

### ✅ S3 Security
- Enabled public access block
- Enabled versioning
- Enabled KMS encryption
- Enabled access logging

### ✅ Network Security
- Restricted SSH access to internal CIDR
- Limited outbound traffic

---

## 📉 Results After Remediation

- ❌ Failed checks reduced: **14 → ~5**
- ✅ High-risk issues resolved
- ⚠️ Remaining findings intentionally left for analysis

---

## 📊 Findings & Risk Analysis

Detailed breakdown available here:

👉 [View Findings Analysis](docs/findings.md)

This includes:
- Risk classification
- Remediation decisions
- Future improvements

---

## 🧠 Key Concepts Demonstrated

- DevSecOps pipeline integration
- Shift-left security practices
- Policy-as-code enforcement
- Risk-based vulnerability management
- Automated IaC scanning

---

## 🚀 How to Run Locally

### Install Checkov
```bash
pip install checkov

Run Scan

checkov -d terraform

🔁 CI/CD Integration

Checkov is integrated into GitHub Actions:

Runs on push and pull request
Fails pipeline on security violations (soft_fail: false)
Provides immediate feedback to developers

📌 Key Takeaway

This project demonstrates that:

Security is not just about fixing everything — it's about identifying, prioritizing, and managing risk effectively within the development lifecycle.

👤 Author

James Lyons
Cloud Security | DevSecOps | AWS





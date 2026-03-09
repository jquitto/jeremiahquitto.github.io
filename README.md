# SRE Portfolio Starter

A professional, batteries-included repository scaffold to showcase Site Reliability Engineering and DevSecOps skills. It includes **Terraform**, **Kubernetes (manifests + Helm)**, **Ansible**, **CI/CD (GitHub Actions)**, **observability (New Relic NRQL)**, and a minimal **containerized app**.

> **Owner:** Jeremiah O. Quitto — Site Reliability Engineer (Tulsa, OK)

## 🔭 Overview
This repo demonstrates how I approach reliability, automation, infrastructure-as-code, and observability using modern tooling. It is intentionally minimal yet production-leaning, with clear documentation and patterns.

## 🧱 Tech Stack
- **IaC:** Terraform (AWS example: S3 + CloudWatch)
- **Kubernetes:** Manifests (Kustomize overlays) and a sample Helm chart
- **Config Management:** Ansible (service health + restart workflow)
- **App:** Python/Flask container with health endpoints
- **CI/CD:** GitHub Actions (build, test, lint)
- **Observability:** New Relic NRQL queries and alert templates

## 📁 Repository Structure
```
sre-portfolio-starter/
├─ .github/workflows/ci.yml
├─ ansible/
│  └─ playbooks/
├─ docker/app/
├─ helm/sample-chart/
├─ infra/terraform/
├─ k8s/
│  ├─ base/
│  └─ overlays/{dev,prod}
├─ observability/newrelic/{nrql,alerts}
└─ scripts/{bash,powershell,python}
```

## 🚀 Getting Started

### Prerequisites
- Docker, kubectl, kustomize, helm
- Terraform (>= 1.4)
- Python 3.10+
- (Optional) New Relic account + NerdGraph API key
- (Optional) AWS credentials configured via environment or profile

### Quick Start
1. **Build the app**
   ```bash
   cd docker/app
   docker build -t sre-sample-app:latest .
   ```
2. **Run locally**
   ```bash
   docker run -p 8080:8080 sre-sample-app:latest
   curl -fsS http://localhost:8080/health
   ```
3. **Deploy to Kubernetes (dev overlay)**
   ```bash
   kubectl apply -k k8s/overlays/dev
   kubectl -n sre-demo get deploy,svc,hpa,pdb
   ```
4. **Provision minimal AWS infra (S3 + CloudWatch)**
   ```bash
   cd infra/terraform
   terraform init
   terraform plan -var 'aws_region=us-east-1' -var 'bucket_name=CHANGE_ME_UNIQUE_BUCKET'
   terraform apply -auto-approve -var 'aws_region=us-east-1' -var 'bucket_name=CHANGE_ME_UNIQUE_BUCKET'
   ```

## 🔔 Observability (New Relic)
- Example NRQL queries live in `observability/newrelic/nrql`.
- Import alert condition JSON templates from `observability/newrelic/alerts`.

## 🔄 CI/CD
GitHub Actions workflow `.github/workflows/ci.yml` lints and tests the sample app and validates K8s manifests (dry-run).

## 🧪 SRE Scenarios Demonstrated
- Health checks (liveness/readiness), resource limits/requests, HPA scaling
- PodDisruptionBudget for reliability during node maintenance
- Declarative infra via Terraform with outputs and variable validation
- Automated service restarts via Ansible when health checks fail
- NRQL-based alert patterns for proactive detection (e.g., pod restarts)

## 🗺️ Roadmap
- Add Helm pipeline with chart linting
- Add GitHub Container Registry publishing
- Add KEDA example for event-driven autoscaling
- Expand Terraform to include an EKS cluster module

## 🤝 Contributing
PRs and issues welcome. Please see `CONTRIBUTING.md` and `CODE_OF_CONDUCT.md`.

## 🪪 License
MIT — see `LICENSE`.

## 📫 Contact
- Email: jeremiahquitto@gmail.com
- LinkedIn: https://www.linkedin.com/in/jeremiahquitto (placeholder)

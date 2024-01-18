# Simple Flask App Deployment to Amazon EKS with Terraform & GitHub Actions

This repository serves as a guide for deploying a basic Flask application on Amazon Elastic Kubernetes Service (EKS). Emphasizing Infrastructure as Code (IaC) practices, container image creation, and automated deployment through Terraform and GitHub Actions, it provides insights into the streamlined process of deploying applications on AWS.

## Project Structure

- **infra:** Terraform code for setting up VPC, EKS, ECR, S3, and the ALB controller.
- **sample-app:** Contains a Python Flask application (`app.py`) for demonstration.
- **kubernetes-manifest:** Kubernetes manifests (`deployment.yaml` and `service.yaml`) for application deployment.
- **.github/workflows:** GitHub Actions workflows (`deploy-cluster.yaml`, `build.yaml`, `deploy.yaml`) for automation.

## Instructions

### Infrastructure Setup

The infrastructure is automatically using Terraform as the Infrastructure as Code (IaC) tool, managed by the GitHub Actions workflow (deploy-cluster.yaml). This workflow orchestrates the creation of essential components, including Amazon Elastic Kubernetes Service (EKS), Amazon Elastic Container Registry (ECR), Amazon Simple Storage Service (S3), and the Application Load Balancer (ALB) controller.

### Application Code and Container Image

1. **Sample Application:**
   - The `sample-app` directory contains a basic Python Flask application (`app.py`). Ensure it prints "Welcome to 2022" and user agent information.

2. **Container Image:**
   - Use Docker to build the container image. Find the Dockerfile and dependencies in the `sample-app` directory.

### Automated Pipeline and Deployment

1. **GitHub Actions Workflows:**
   - `.github/workflows` includes workflows for various tasks.
     - `deploy-cluster.yaml`: Deploys infrastructure, including the VPC, EKS cluster, and related components.
     - `build.yaml`: Builds the Docker image for the sample application and pushes it to ECR.
     - `deploy.yaml`: Deploys the sample application to the EKS cluster using Kubernetes manifests.

2. **Deployment:**
   - Kubernetes manifests (`deployment.yaml` and `service.yaml`) in the `kubernetes-manifest` directory manage the application deployment.

## How to Run Locally (Optional)

If you want to run the application locally for testing purposes:

```bash
cd sample-app
pip install -r requirements.txt
python app.py
```

Access the application at [http://localhost:5000](http://localhost:5000) in your browser.
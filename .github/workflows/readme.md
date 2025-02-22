# 🚀 CI/CD Pipeline for Kubernetes Deployment

This repository automates the **build, security scanning, and deployment** of a Java application using **GitHub Actions, Docker, Terraform, and Helm**.

---

## 🔹 Workflow Overview

### 1️⃣ Continuous Integration (CI)
**Triggers on:**
- Pushes to `develop` branch  
- Pull requests to `main` branch  

#### **Pipeline Steps:**
- ✅ Checkout code  
- ✅ Set up Java & Maven  
- ✅ Run tests & publish results  
- ✅ Perform CodeQL security analysis  
- ✅ Build & push Docker image (`sadik8143/spc:1.0`)  
- ✅ Run Trivy vulnerability scan  

---

### 2️⃣ Continuous Deployment (CD)
**Triggers on:**  
- Pushes to `release` branch  

#### **Pipeline Steps:**
- ✅ Checkout repository  
- ✅ Pull latest Docker image  
- ✅ Run Trivy security scan  
- ✅ Authenticate with Azure  
- ✅ Deploy infrastructure with Terraform  
- ✅ Set AKS credentials  
- ✅ Install Helm & deploy application  
- ✅ Retrieve Kubernetes service details  

---

## 🔹 Deployment Details
- **Docker Hub Image:** `sadik8143/spc:1.0`  
- **Kubernetes Cluster:** Azure AKS (`myAKSCluster`)  
- **Helm Release:** `spc-release` in `default` namespace  
- **Terraform Infrastructure:** Stored in `infra/` directory  

---

## 📌 Environment Variables & Secrets
Ensure the following secrets are set in **GitHub Actions**:

### **Docker Hub Credentials:**  
- `USER_NAME`  
- `PASSWORD`  

### **Azure Credentials:**  
- `AZURE_CLIENT_ID`  
- `AZURE_CLIENT_SECRET`  
- `AZURE_SUBSCRIPTION_ID`  
- `AZURE_TENANT_ID`  

---

## 🚀 Deployment Status
View **GitHub Actions** to track build & deployment progress.

---

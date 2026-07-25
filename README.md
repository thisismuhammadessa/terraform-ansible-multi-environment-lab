# 🚀 Multi-Environment Infrastructure Automation using Terraform & Ansible

![AWS](https://img.shields.io/badge/AWS-EC2-orange?style=for-the-badge&logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![Ansible](https://img.shields.io/badge/Ansible-Automation-black?style=for-the-badge&logo=ansible)
![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-E95420?style=for-the-badge&logo=ubuntu)
![Linux](https://img.shields.io/badge/Linux-DevOps-FCC624?style=for-the-badge&logo=linux)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=for-the-badge&logo=github)

---

# 📖 Project Overview

This project demonstrates a complete **Infrastructure as Code (IaC)** and **Configuration Management** workflow using **Terraform** and **Ansible**.

The infrastructure is deployed on **AWS EC2** and divided into three independent environments:

- 🔹 Development (Dev)
- 🔹 Staging (Stg)
- 🔹 Production (Prod)

Terraform provisions the infrastructure while Ansible automatically configures each server after deployment.

---


# 🏗 Project Architecture

The following diagram illustrates the complete workflow of this project, where Terraform provisions AWS infrastructure across multiple environments and Ansible automates server configuration using environment-specific inventories.

<p align="center">
  <img src="images/Project-design.gif" alt="Terraform Ansible Multi Environment Architecture" width="100%">
</p>

# 🎯 Objectives

- Provision AWS infrastructure using Terraform
- Implement reusable Terraform modules
- Deploy separate Dev, Staging, and Production environments
- Configure servers automatically using Ansible
- Install and configure Nginx
- Deploy a custom HTML webpage
- Maintain separate inventories for each environment
- Demonstrate Infrastructure as Code best practices

---

# 🛠 Technologies Used

| Technology | Purpose |
|------------|----------|
| AWS EC2 | Virtual Servers |
| Terraform | Infrastructure Provisioning |
| Ansible | Configuration Management |
| Ubuntu | Operating System |
| Linux | Server Environment |
| Git | Version Control |
| GitHub | Source Code Management |
| SSH | Secure Remote Access |

---

# 📂 Project Structure

```
terra-multi-env
│
├── terraform
│   ├── infra
│   │   ├── bucket.tf
│   │   ├── dynamo.tf
│   │   ├── my_ec2.tf
│   │   ├── variables.tf
│   │   └── output.tf
│   │
│   ├── main.tf
│   ├── providers.tf
│   └── terraform.tf
│
├── ansible
│   ├── inventories
│   │   ├── dev
│   │   ├── stg
│   │   └── prod
│   │
│   ├── playbooks
│   │   └── install_nginx.yml
│   │
│   └── roles
│       └── nginx-role
│           ├── files
│           │   └── index.html
│           ├── tasks
│           │   └── main.yml
│           └── handlers
│
└── README.md
```

---

# ☁ Terraform Workflow

Terraform creates:

- AWS EC2 Instances
- Security Groups
- SSH Key Pair
- S3 Bucket
- DynamoDB Table (State Locking)
- Environment-based Infrastructure

Terraform Modules

```
Root Module
      │
      ├─────────────┐
      │             │
      ▼             ▼
   Dev Module   Stg Module
      │
      ▼
  Prod Module
```

Each module creates its own resources independently.

---

# 🌍 Environment Configuration

## Development

```
Environment : Dev
Instances   : 2
Instance Type : t2.micro
```

---

## Staging

```
Environment : Stg
Instances   : 2
Instance Type : t2.micro
```

---

## Production

```
Environment : Prod
Instances   : 3
Instance Type : t2.micro
```

---

# ⚙ Ansible Configuration

Separate inventories are maintained for each environment.

Example:

```
inventories/
│
├── dev
├── stg
└── prod
```

Each inventory contains:

- Server IPs
- SSH User
- SSH Private Key
- Python Interpreter

Example:

```ini
[servers]

server1 ansible_host=<Public-IP>
server2 ansible_host=<Public-IP>

[servers:vars]

ansible_user=ubuntu
ansible_ssh_private_key_file=terraform/tws-terra-key
ansible_python_interpreter=/usr/bin/python3
```

---

# 🚀 Nginx Deployment

Ansible Role performs:

- Update APT Cache
- Install Nginx
- Enable Nginx Service
- Start Nginx
- Deploy Custom HTML Page

Task Flow

```
Install Nginx

        │

        ▼

Enable Service

        │

        ▼

Start Service

        │

        ▼

Copy index.html

        │

        ▼

Website Live
```

---

# ▶ Deployment Steps

## Clone Repository

```bash
git clone https://github.com/yourusername/terra-multi-env.git

cd terra-multi-env
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate

```bash
terraform validate
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## Verify Outputs

```bash
terraform output
```

---

## Test SSH Connectivity

```bash
ansible -i inventories/dev servers -m ping
```

Expected Output

```
server1 | SUCCESS =>

pong

server2 | SUCCESS =>

pong
```

---

## Deploy Nginx

```bash
ansible-playbook -i inventories/dev playbooks/install_nginx.yml
```

---

# 🔒 Security

The following sensitive files are excluded using `.gitignore`:

```
terraform/.terraform/

terraform.tfstate

terraform.tfstate.backup

terraform/.terraform.lock.hcl

tws-terra-key

tws-terra-key.pub
```

---

# 📸 Expected Result

Each EC2 instance hosts the custom webpage.

Example:

```
http://<EC2-Public-IP>
```

Displays:

```
Welcome to Muhammad Essa's DevOps Project

Nginx successfully deployed using Ansible Role.
```

---

# 📚 DevOps Concepts Demonstrated

- Infrastructure as Code (IaC)

- Terraform Modules

- Remote State Management

- AWS EC2 Provisioning

- Configuration Management

- Ansible Inventories

- Ansible Roles

- SSH Automation

- Linux Administration

- Environment Separation

- Infrastructure Automation

- Cloud Deployment

---

# 👨‍💻 Author

## Muhammad Essa

**DevOps Engineer**

### Skills

- Linux
- AWS
- Terraform
- Ansible
- Docker
- Kubernetes
- Jenkins
- Git
- GitHub
- Python

LinkedIn

https://www.linkedin.com/in/muhammad-essa-566b243a2/

---

# ⭐ If you found this project useful, don't forget to Star the repository.

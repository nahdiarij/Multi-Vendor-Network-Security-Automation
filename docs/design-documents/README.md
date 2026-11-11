# Network Design & Technical Documentation

This directory documents the design and technical implementation of the Multi-Vendor Network Security Architecture.

The documentation is based on the architecture design and implementation work described in the PFE report.

## 1. Architecture Design

### 1.1 Security Architecture

The infrastructure follows a Defense-in-Depth approach and is organized into three security zones:

- **WAN:** External and untrusted network.
- **DMZ:** Intermediate zone hosting externally exposed services.
- **LAN:** Internal network containing users and sensitive resources.

### 1.2 Network Infrastructure

The architecture integrates multiple network and security technologies:

- Cisco ASA
- Cisco FTD
- Cisco WSA
- Cisco ESA
- Cisco CSR1000v
- Cisco Catalyst 2960
- Fortinet FortiGate 500E
- Snort IPS

### 1.3 Automation Architecture

A centralized automation environment was designed to manage network configurations.

Its main components include:

- Ansible control server
- YAML configuration playbooks
- SSH and dedicated APIs for device communication
- Python scripts using Netmiko for configuration verification

## 2. Technical Implementation

### 2.1 Network Deployment

The infrastructure was deployed in an EVE-NG virtual environment running on a KVM-based Linux server.

### 2.2 Configuration Automation

Ansible was used for:

- Centralized configuration deployment
- Automated configuration backups
- Configuration drift detection
- Cisco ACL deployment
- Infrastructure information collection

### 2.3 Infrastructure Provisioning

Terraform was used to describe and provision infrastructure through declarative configuration files.

### 2.4 CI/CD Integration

A GitLab CI/CD pipeline was implemented to automate Ansible workflows, including configuration backups and drift detection.

## 3. Technical References

The detailed implementation, validation scenarios, architecture diagrams, and screenshots are documented in the corresponding project directories.


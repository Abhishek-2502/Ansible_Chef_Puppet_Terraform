**Terraform:** For Provisioning Infra (Provisioning Tool) (Decommisioning Tool)

**Ansible:** For managing and updating Infra 

**Chef:** Similar to Ansible but pull based

**Prometheus:** Observability (Monitoring CPU, Network,etc metrics, Logging, Tracing for errors, Alerting)

**Grafana:** Dashboard for Prometheus data


## INSTALLATION:
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### Windows:
```
choco install terraform
terraform --version
```

### Linux:
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

#### Install the HashiCorp GPG key:
```
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

#### Verify the key's fingerprint:
```
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```

#### Other
```
sudo apt update
sudo apt-get install terraform
terraform --version
terraform -help
```
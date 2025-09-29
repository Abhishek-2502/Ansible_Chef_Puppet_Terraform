# Puppet Master and Agent Setup

This guide explains how to set up a **Puppet Master** and a **Puppet Agent (Node)** on Linux machines. Puppet helps automate configuration management across servers.

---

## 🚀 Prerequisites

* Two Linux machines one for **Puppet Master**, one for **Agent/Node** 
* **NOTE: Ubuntu Version <= 20.xx**

---

## 🖥️ ON PUPPET MASTER

### 1. Stop Firewall (to avoid interference)

```bash
sudo systemctl stop ufw
sudo systemctl disable ufw
sudo systemctl status ufw
```

OR 

```bash
sudo systemctl stop firewalld
```

### 2. Change Hostname

```bash
sudo hostnamectl set-hostname puppet
hostname
```

### 3. Download Puppet Repository

Change URL according to your Ubuntu Version (`lsb_release -a`)
```bash
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
```

### 4. Install Puppet Server

```bash
sudo apt -y install puppetserver
```

### 5. Export Path and Check Version

```bash
export PATH=/opt/puppetlabs/bin:$PATH
```
```bash
puppet --version
```

### 6. Configure Memory Usage (Optional)

Edit the config:

```bash
sudo apt install vim -y
sudo vim /etc/default/puppetserver
```

Update `JAVA_ARGS`:

```bash
JAVA_ARGS="-Xms512m -Xmx512m -Djruby.logger.class=com.puppetlabs.jruby_utils.jruby.Slf4jLogger"
```

### 7. Start Puppet Server

```bash
sudo systemctl start puppetserver
sudo systemctl enable puppetserver
sudo systemctl status puppetserver
```

### 8. Check Master IP

```bash
ip a
```

OR

External_IP in case of Cloud Platform

---

## 🖥️ ON PUPPET AGENT (NODE)

### 1. Add Master IP in `/etc/hosts`

```bash
sudo vim /etc/hosts
```

Add entry:

ip_of_puppet_master hostname_master dns_master
```
Example: 34.122.35.185 puppet puppet-master
```

### 2. Download Puppet Repository

Change URL according to your Ubuntu Version (`lsb_release -a`)
```bash
wget https://apt.puppet.com/puppet7-release-focal.deb
sudo dpkg -i puppet7-release-focal.deb
sudo apt update
```

### 3. Install Puppet Agent

```bash
sudo apt -y install puppet-agent
```

### 4. Check Connectivity with Master

Add 8140 in Security Group (AWS) or Firewall Rule (GCP)
```bash
sudo apt install telnet -y
telnet puppet 8140
```

### 5. Start Puppet Agent & Send Certificate Request

```bash
sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
```

---

## 🔑 ON PUPPET MASTER (Certificate Signing)

### 1. Check Unsigned Certificates

```bash
sudo /opt/puppetlabs/bin/puppetserver ca list
```

### 2. Sign the Certificate

```bash
sudo /opt/puppetlabs/bin/puppetserver ca sign --certname <node_fqdn>
```
`Example: sudo /opt/puppetlabs/bin/puppetserver ca sign --certname node.us-central1-c.c.hale-tractor-428316-f6.internal`

### 3. Verify Signed & Unsigned Certificates

```bash
sudo /opt/puppetlabs/bin/puppetserver ca list --all
```

---

### 📜 Creating a Manifest

On **Puppet Master**:

```bash
sudo mkdir -p /etc/puppetlabs/code/environments/production/manifests
sudo touch /etc/puppetlabs/code/environments/production/manifests/sample.pp
sudo vim /etc/puppetlabs/code/environments/production/manifests/sample.pp
```

Add:

```puppet
node 'Agent_Hostname' {

  # Ensure apt cache is updated
  exec { 'apt-update':
    command => '/usr/bin/apt-get update',
    path    => ['/usr/bin', '/usr/sbin'],
  }

  # Install Apache after updating apt
  package { 'apache2':
    ensure  => installed,
    require => Exec['apt-update'],
  }

  # Ensure Apache service is running and enabled
  service { 'apache2':
    ensure => running,
    enable => true,
    require => Package['apache2'],  # Ensure service starts after package installation
  }
}
```

`Agent_Hostname Example: node.us-central1-c.c.hale-tractor-428316-f6.internal`

---

## 🖥️ ON PUPPET AGENT

Pull the configuration from master:

```bash
sudo /opt/puppetlabs/bin/puppet agent --test
```
```bash
sudo /opt/puppetlabs/bin/puppet agent --test --verbose --debug
```


---

## 🌐 Verify Setup

On Puppet Agent
```bash
apache2 -v
```

Or Open a browser and go to:

```
http://localhost
```
or
```
http://agent_node_external_ip
```

If successful, Apache (`httpd`) should be installed and running on the agent.

---

## ✅ Summary

* Puppet Master manages configuration.
* Agent connects, requests a certificate, and pulls manifests.
* In this setup, the agent installs `httpd` when pulling from master.

## Author 
Abhishek Rajput

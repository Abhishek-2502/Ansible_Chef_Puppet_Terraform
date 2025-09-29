#!/bin/bash

# Update the package index
sudo apt-get update

# Install Nginx
sudo apt-get install nginx -y

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

echo "<h1>Installation Complete of nginx</h1>" | sudo tee /var/www/html/index.html
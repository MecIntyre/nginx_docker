#!/bin/sh

# APT in non-interactive mode
export DEBIAN_FRONTEND=noninteractiv

# enable package transport via HTTPS
apt-get -y install apt-transport-https ca-certificates curl \
  gnupg lsb-release

# Official GPG Key for certification added
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Repo and add Docker + Keyring
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# update the package datas from the new added repo
apt-get update

# Docker, Docker-Compose and Git install
apt-get -y install docker-ce docker-ce-cli containerd.io \
  git docker-compose

# Docker enable
systemctl enable --now docker

# add user "vagrant"
adduser vagrant docker

# start containerization
docker-compose up -d

# NGINX start
docker run -d --name nginx --restart always -p 80:80 -p 443:443 nginx

# Promtail start with respective volumes and config
docker run --name promtail --restart always --volume "$PWD/promtail:/etc/promtail" --volume "/var/log:/var/log" grafana/promtail:latest -config.file=/etc/promtail/config.yaml

# Prometheus start
docker run -d --name prometheus --restart always -p 9090:9090 prom/prometheus

# Cadvisor start
docker run -d --name cadvisor --restart always -p 8080:8080 google/cadvisor

# Node-Exporter Start
docker run -d --name node-exporter --restart always -p 9100:9100 prom/node-exporter

# Grafana start and link with Prometheus for communication
docker run -d --name grafana --restart always --link prometheus -p 3000:3000 grafana/grafana

#!/bin/bash

echo "Current dir: $(pwd)"
ls -la
ls -la server

apt update -y && apt upgrade -y && apt autoremove -y && apt autoclean -y
apt-get install default-jdk -y

mkdir -p server
curl -L -o server/server.jar https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/455/downloads/paper-1.8.8-455.jar

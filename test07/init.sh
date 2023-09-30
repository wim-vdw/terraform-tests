#!/bin/bash
timedatectl set-timezone Europe/Brussels
apt-get update
apt-get upgrade -y
apt-get install zsh -y
apt-get install nginx -y

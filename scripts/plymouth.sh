#!/bin/bash
set -e
sudo -A plymouth-set-default-theme debian-custom
sudo -A update-initramfs -u
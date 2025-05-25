#!/bin/bash

# Install persistent rules
apt install iptables-persistent -y

# Simpan aturan yang sedang aktif
netfilter-persistent save

#!/bin/bash

# Bersihkan aturan lama
iptables -F
iptables -X

# Aturan dasar
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Izinkan DHCP & DNS
iptables -A INPUT -p udp --dport 67 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# Izinkan ICMP (ping)
iptables -A INPUT -p icmp -j ACCEPT

# Drop semua koneksi lain
iptables -A INPUT -j DROP

echo "Aturan iptables telah diterapkan."

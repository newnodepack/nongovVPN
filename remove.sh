#!/bin/bash
set -e

echo "=========================================="
echo "  VPN Server - Remove"
echo "=========================================="

docker stack rm vpn 2>/dev/null || true
sleep 5

sudo iptables -D FORWARD -s 10.8.0.0/24 -j ACCEPT 2>/dev/null || true
sudo iptables -D FORWARD -d 10.8.0.0/24 -j ACCEPT 2>/dev/null || true
sudo iptables -t nat -D POSTROUTING -s 10.8.0.0/24 -j MASQUERADE 2>/dev/null || true

read -p "Delete volumes? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker volume rm vpn_vpn-certs vpn_vpn-logs 2>/dev/null || true
    echo "  ✅ Volumes deleted"
fi

echo "  ✅ Removed"
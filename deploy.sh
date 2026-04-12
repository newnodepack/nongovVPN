#!/bin/bash
set -e

echo "=========================================="
echo "  VPN Server - Deploy"
echo "=========================================="

echo "[1/3] Host setup..."
sudo sysctl -w net.ipv4.ip_forward=1 > /dev/null
sudo sysctl -w net.ipv4.conf.all.rp_filter=0 > /dev/null
sudo sysctl -w net.ipv4.conf.default.rp_filter=0 > /dev/null
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -C POSTROUTING -s 10.8.0.0/24 -j MASQUERADE 2>/dev/null || \
    sudo iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j MASQUERADE
echo "  ✅ Done"

echo "[2/3] TUN device..."
sudo mkdir -p /dev/net
[ -c /dev/net/tun ] || sudo mknod /dev/net/tun c 10 200
sudo chmod 666 /dev/net/tun
echo "  ✅ Done"

echo "[3/3] Deploying..."
docker swarm init 2>/dev/null || true
docker stack rm vpn 2>/dev/null && sleep 5 || true
docker stack deploy -c docker-stack.yml vpn

echo ""
echo "Waiting for service..."
for i in $(seq 1 30); do
    if docker service logs vpn_vpn-server 2>&1 | grep -q "Listening"; then
        echo "  ✅ VPN Server Ready!"
        break
    fi
    [ $i -eq 30 ] && echo "  ⚠️ Check: docker service logs vpn_vpn-server"
    sleep 1
done

echo ""
echo "=========================================="
echo "  ✅ Deployed!"
echo "=========================================="
echo "  Logs:   docker service logs -f vpn_vpn-server"
echo "  Stop:   sudo bash remove.sh"
echo "=========================================="
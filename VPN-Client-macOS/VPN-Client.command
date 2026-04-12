#!/bin/bash
#────────────────────────────────────
#  VPN Client Launcher
#────────────────────────────────────

# 빌드 시 설정된 경로
DEFAULT_PATH="/Users/baegseungcheol/Documents/my-projects/vpn-server/client/dist/VPN-Client-macOS"

# 경로 탐색: BASH_SOURCE → \$0 → 빌드 경로
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [ -f "$0" ] && [ "$(basename "\$0")" = "VPN-Client.command" ]; then
    SCRIPT_PATH="$(cd "$(dirname "\$0")" && pwd)"
else
    SCRIPT_PATH="${DEFAULT_PATH}"
fi

VPN_BIN="${SCRIPT_PATH}/VPN-Client"

# 빌드 경로로 폴백
if [ ! -f "${VPN_BIN}" ]; then
    SCRIPT_PATH="${DEFAULT_PATH}"
    VPN_BIN="${SCRIPT_PATH}/VPN-Client"
fi

echo "=========================================="
echo "  VPN Client - macOS"
echo "=========================================="
echo "  Path: ${SCRIPT_PATH}"
echo ""

if [ ! -f "${VPN_BIN}" ]; then
    echo "  ❌ VPN-Client not found!"
    echo ""
    echo "  Run manually:"
    echo "    cd /path/to/VPN-Client-macOS"
    echo "    sudo ./VPN-Client"
    echo ""
    read -p "  Press Enter to close..."
    exit 1
fi

chmod +x "${VPN_BIN}" 2>/dev/null

if [ "$(id -u)" -eq 0 ]; then
    cd "${SCRIPT_PATH}"
    exec "${VPN_BIN}"
fi

echo "  Enter admin password:"
echo ""
sudo bash -c "cd '${SCRIPT_PATH}' && '${VPN_BIN}'"

echo ""
read -p "  Press Enter to close..."

#!/bin/bash

RATHOLE_DIR="/root/rathole-core"

CONFIG_FILE=$(find "$RATHOLE_DIR" -maxdepth 1 -type f -name "*.toml" | head -n 1)
if [ -z "$CONFIG_FILE" ]; then
  echo "هیچ فایل کانفیگ .toml در $RATHOLE_DIR پیدا نشد!"
  exit 1
fi

CONFIG_PATH="/root/rathole_watchdog.conf"

if [ ! -f "$CONFIG_PATH" ]; then
  echo "آدرس IP سرور مقصد (برای تست اتصال curl) را وارد کن:"
  read -r TARGET_IP
  echo "شماره پورت سرور مقصد:"
  read -r TARGET_PORT

  echo "TARGET_IP=$TARGET_IP" > "$CONFIG_PATH"
  echo "TARGET_PORT=$TARGET_PORT" >> "$CONFIG_PATH"
fi

source "$CONFIG_PATH"

check_and_restart() {
  TEST_URL="http://$TARGET_IP:$TARGET_PORT"

  if ! curl --max-time 5 -sSf "$TEST_URL" > /dev/null; then
    echo "$(date) - اتصال قطع شده! ریستارت رتهول..."
    pkill -f rathole
    nohup "$RATHOLE_DIR/rathole" "$CONFIG_FILE" >/dev/null 2>&1 &
  else
    echo "$(date) - اتصال سالمه."
  fi
}

SERVICE_FILE="/etc/systemd/system/rathole_watchdog.service"
if [ ! -f "$SERVICE_FILE" ]; then
  echo "در حال ساخت فایل systemd برای watchdog..."

  cat <<EOF | sudo tee "$SERVICE_FILE" > /dev/null
[Unit]
Description=Rathole Tunnel Watchdog Service
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash /root/rathole_watchdog.sh
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

  sudo systemctl daemon-reload
  sudo systemctl enable rathole_watchdog.service
  echo "سرویس systemd ساخته و فعال شد."
fi

while true; do
  check_and_restart
  sleep 90
done

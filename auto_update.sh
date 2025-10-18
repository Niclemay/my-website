#!/bin/bash
# auto_update.sh ? run TA-Script.py (in venv) then deploy.sh
# Use full paths so cron can run it without interactive environment.

set -euo pipefail
export HOME=/home/nicolas
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

LOG="$HOME/Desktop/auto_update.log"
DATE="$(date '+%Y-%m-%d %H:%M:%S')"

echo "=== auto_update start: $DATE ===" >> "$LOG"

# 1) Run the Python script with the specific interpreter in your venv
/home/nicolas/myenv/bin/python3 /home/nicolas/Desktop/market_swing_reversal_dashboard.py>> "$LOG" 2>&1 || {
  echo "Python script failed at $(date)" >> "$LOG"
  exit 1
}


# 2) Run deploy script to push changes to GitHub
/home/nicolas/Desktop/my-website/deploy.sh >> "$LOG" 2>&1 || {
  echo "deploy.sh failed at $(date)" >> "$LOG"
  exit 1
}

echo "=== auto_update end: $(date '+%Y-%m-%d %H:%M:%S') ===" >> "$LOG"
echo "" >> "$LOG"

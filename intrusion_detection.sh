#!/bin/bash

# === [ CONFIG ] ===
LOG_FILE="/var/log/auth.log"
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"

TIMESTAMP=$(date '+%Y-%m-%d-%H-%M')
ALERT_LOG="$LOG_DIR/alerts_$TIMESTAMP.log"

# === [ 1. Check if log file exists ] ===
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE not found. Exiting."
    exit 1
fi

# === [ Failed Login Attempts ] ===
echo "Checking for failed login attempts..." >> "$ALERT_LOG"
grep -i "password check failed" "$LOG_FILE" | tail -n 10 >> "$ALERT_LOG"

# === [ Root Login Sessions ] ===
echo -e "\nChecking for root login..." >> "$ALERT_LOG"
grep -i "session opened for user root" "$LOG_FILE" | tail -n 5 >> "$ALERT_LOG"

# === [ Sudo Usage ] ===
echo -e "\nChecking for sudo usage..." >> "$ALERT_LOG"
grep -i "sudo:" "$LOG_FILE" | tail -n 5 >> "$ALERT_LOG"

# === [ Brute-force Detection: Repeated IPs ] ===
echo -e "\nChecking for repeated failed login IPs (brute-force attempts)..." >> "$ALERT_LOG"
grep "Failed password" "$LOG_FILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head >> "$ALERT_LOG"

# === [ New Users Added ] ===
echo -e "\nChecking for new users added..." >> "$ALERT_LOG"
grep "useradd" "$LOG_FILE" | tail -n 5 >> "$ALERT_LOG"

# === [ Successful SSH Logins ] ===
echo -e "\nChecking for successful SSH logins..." >> "$ALERT_LOG"
grep "Accepted password" "$LOG_FILE" | tail -n 5 >> "$ALERT_LOG"

# === [ Completion Message ] ===
echo -e "\nIntrusion detection check complete."
echo "Alerts saved to: $ALERT_LOG"

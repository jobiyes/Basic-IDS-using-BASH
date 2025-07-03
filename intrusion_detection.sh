#!/bin/bash

# Path to the system authentication log file
LOG_FILE="/var/log/auth.log"

# Create a timestamp for unique log file name
TIMESTAMP=$(date '+%Y-%m-%d-%H-%M')
ALERT_LOG="alerts_$TIMESTAMP.log"

# Log failed login attempts
echo "Checking for failed login attempts..." >> "$ALERT_LOG"
grep -i "password check failed" "$LOG_FILE" | tail -n 10 >> "$ALERT_LOG"

# Log root login sessions
echo "Checking for root login..." >> "$ALERT_LOG"
grep -i "session opened for user root" "$LOG_FILE" | tail -n 5 >> "$ALERT_LOG"

# Completion message
echo "Intrusion detection check complete. Alerts saved to $ALERT_LOG"

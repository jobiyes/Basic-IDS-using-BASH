#  Intrusion Detection Script (Bash)

This project is a simple **Bash-based intrusion detection system** that scans Linux authentication logs to identify suspicious activity.

##  Features

- Detects failed login attempts
- Detects root login sessions
- Monitors `sudo` command usage
- Flags repeated failed login IPs (possible brute-force)
- Detects new users added to the system
- Logs successful SSH logins
- Generates a new alert log file on every run


### Project Structure
```
.
├── intrusion_detection.sh   # Main script
├── logs/                    # Alert logs (auto-created)
├── .gitignore               # Ignores logs and temp files
└── README.md                # Project info
```

### Make sure the script is executeable:  
```
chmod +x intrusion_detection.sh
```

### How to run it manually
```
./intrusion_detection.sh
```


### Check the results in
```
alerts_YYYY-MM-DD-HH-MM.log    # A new alert log is created every time the script runs
```



## Automate with cron

1. Open your crontab configuration:
```
crontab -e
```

2. Add the following line to schedule the script:
```
0 9 * * * $HOME/IDS\ Project/intrusion_detection.sh
```

Once set,Your script will run daily at 9am automatically


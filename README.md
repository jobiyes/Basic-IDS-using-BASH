# Linux Intrusion Detection System (IDS) Using Bash

This project is a basic Intrusion Detection System (IDS) built with a Bash script on Linux. It monitors system authentication logs to detect:

-  Failed login attempts
-  Root user login sessions

All alerts are saved into a single log file: alerts.log.


##  Project Structure
IDS-Project:

1.intrusion_detection.sh        # Main Bash script

2.alerts_YYYY-MM-DD-HH-MM.log  # Auto-generated alert files (example)

3.gitignore                    # Ignores all alerts_*.log files

4.cronjob.txt                  # Cron job instruction

5.README.md                     # Project documentation



## How to run it manually
./intrusion_detection.sh



## Check the results in
alerts_YYYY-MM-DD-HH-MM.log    # A new alert log is created every time the script runs




## Automate with cron
1.Open your crontab configuration:

crontab -e


2.Add the following line to schedule the script:

0 9 * * * $HOME/IDS\ Project/intrusion_detection.sh

3.Make sure the script is executeable:  

chmod +x intrusion_detection.sh

Once set,Your script will run daily at 9am automatically


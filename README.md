# Splunk SIEM Log Analysis Lab

This project demonstrates a SIEM-based log monitoring and incident response system using Splunk.

## Features

- Log ingestion from Linux system logs
- Detection of SSH brute-force attacks
- SPL-based threat detection
- Security monitoring dashboard
- GeoIP attack visualization
- Incident response using firewall rules

## Architecture

Linux Logs → Splunk Monitor → Splunk Index → SPL Queries → Dashboard → Alert → Remediation

## Attack Simulation

SSH brute-force attacks were simulated using Hydra.

hydra -l kali -P pass.txt ssh://TARGET_IP

## Detection Query

index=main "authentication failure"
| rex "rhost=(?<src_ip>\d+.\d+.\d+.\d+)"
| stats count by src_ip
| sort -count


## GeoIP Attack Visualization

index=main "authentication failure"
| rex "rhost=(?<src_ip>\d+.\d+.\d+.\d+)"
| iplocation src_ip
| stats count by Country lat lon


## Remediation Script

The system blocks malicious IPs using iptables.
iptables -A INPUT -s <attacker_ip> -j DROP


## Dashboard Panels

- Failed Authentication Attempts
- Authentication Failures Over Time
- Top Active Users
- Global Attack Sources

## Technologies Used

- Splunk Enterprise
- Linux
- Hydra
- Bash scripting

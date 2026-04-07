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

Linux Logs → DVWA / SSH (Kali Server) → Apache & System Logs → Universal Forwarder → Splunk Enterprise → Indexer → SPL Queries → Dashboard → Alerts → Remediation

## Log Collection

Logs are forwarded using Splunk Universal Forwarder instead of manual log extraction.

## 🚨 Attack Simulation

## 1️⃣ SSH Brute Force Attack were simulated using Hydra.

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
Run this Script to Block IP sudo /opt/splunk/bin/block_ip.sh <IP>


## Dashboard Panels

- Failed Authentication Attempts
- Authentication Failures Over Time
- Top Active Users
- Global Attack Sources

## Technologies Used

- Splunk Enterprise
- Splunk Universal Forwarder
- Linux
- Hydra
- Bash

## 2️⃣ SQL Injection (DVWA)
🔹 Types Performed:
- Error-based SQLi
- Union-based SQLi
- Blind SQL Injection

## Payloads Used:

' OR '1'='1
UNION SELECT NULL, database()
1' AND 1=1 #
1' AND SLEEP(5) #

## Detection Query:

index=main ("UNION" OR "' OR" OR "SLEEP" OR "AND 1=1")

## 3️⃣ Cross-Site Scripting (XSS)
🔹 Types Performed:
- Reflected XSS
- Stored XSS
- DOM-based XSS

## Payload:

<script>alert('XSS')</script>
🔍 XSS Detection Strategy
- Reflected XSS → Payload-based detection
- Stored XSS → Endpoint & behavior-based detection
- index=main "/xss_s/"
| rex field=_raw "^(?<ip>\d+\.\d+\.\d+\.\d+)"
| stats count by ip

## Screenshots

See `/screenshots` folder

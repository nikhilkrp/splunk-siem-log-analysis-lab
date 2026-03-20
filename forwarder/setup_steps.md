# Splunk Universal Forwarder Setup

## Install Forwarder

cd ~/Downloads
tar -xvzf splunkforwarder*.tgz
sudo mv splunkforwarder /opt/

## Start Forwarder

cd /opt/splunkforwarder/bin
sudo ./splunk start --accept-license

## Connect to Splunk Enterprise

sudo ./splunk add forward-server localhost:9997

## Add Log Monitoring

sudo ./splunk add monitor /var/log/syslog

## Restart Forwarder

sudo ./splunk restart

#!/bin/bash

IP=$1

echo "Blocking attacker IP: $IP"

iptables -A INPUT -s $IP -j DROP

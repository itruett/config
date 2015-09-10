#!/bin/bash

NETWORK="Wi-Fi"
PROXY=localhost
PORT=5000
KEY=~/.ssh/key.pem
APPLIANCE=user@ip

networksetup -setsocksfirewallproxy "$NETWORK" $PROXY $PORT
ssh -i ~/.ssh/authx-ssh-key.pem -D:$PORT $APPLIANCE
networksetup -setsocksfirewallproxystate "$NETWORK" off


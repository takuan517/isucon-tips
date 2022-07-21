#!/bin/bash

sudo apt install netdata

MYIP=$(hostname -i)
MYIPV4=$(echo $MYIP | cut -d ' ' -f 1)
sed "s/17.0.0.1/$MYIPV4/" -i /etc/netdata/netdata.conf
#!/bin/sh /etc/rc.local

cd /etc
wget -O rc.local https://raw.githubusercontent.com/xiv3r/Linux-Performance/refs/heads/main/perf.sh
chmod +x /etc/rc.local

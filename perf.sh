#!/bin/bash /etc/rc.local

cd /etc/
echo 'echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor' >> /etc/rc.local
chmod +x rc.local

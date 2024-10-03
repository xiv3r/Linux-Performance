#!/bin/bash /etc/rc.local

echo 'echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor' >> /etc/rc.local
chmod +x /etc/rc.local

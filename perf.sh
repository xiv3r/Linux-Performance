#!/bin/bash /etc/rc.local

echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

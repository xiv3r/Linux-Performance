#!/bin/bash /etc/rc.local

sudo sed -i 's/exit 0//' /etc/rc.local

echo "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> /etc/rc.local
echo "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq" >> etc/rc.local
echo "exit 0" >> /etc/rc.local
chmod +x /etc/rc.local

echo 'Done Installing into /etc/rc.local...'
echo 'Require system reboot to apply the settings'

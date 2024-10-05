#!/bin/bash /etc/rc.local

# Remove exit 0 from the top
sed -i 's/exit 0//' /etc/rc.local

# CPU Power Max Performance
echo "echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor" >> /etc/rc.local

# CPU Frequency Max Performance
echo "cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq" >> /etc/rc.local

# Add exit 0 to the bottom
echo "exit 0" >> /etc/rc.local

#Make Executable
chmod +x /etc/rc.local

echo 'Done Installing into /etc/rc.local...'
echo 'Require system reboot to apply the settings'

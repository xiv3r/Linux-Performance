#!/bin/sh

# Remove exit 0 from the top
sed -i 's/exit 0//' /etc/rc.local

cat >>/etc/rc.local << EOF
# CPU Max Performance
echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Dynamically set Max CPU Frequencies 
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
exit 0
EOF

#Make Executable
systemctl enable rc-local
chmod 755 /etc/rc.local
sh /etc/rc.local

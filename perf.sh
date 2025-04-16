#!/bin/sh

# Remove exit 0 from the top
sed -i 's/exit 0//' /etc/rc.local

cat >>/etc/rc.local << EOF
# CPU Power Max Performance
echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# CPU Frequency Max Performance
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq

# Add exit 0 to the bottom
exit 0
EOF

#Make Executable
chmod 755 /etc/rc.local
sh /etc/rc.local

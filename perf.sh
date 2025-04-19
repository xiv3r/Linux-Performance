#!/bin/sh

# Over commit memory for max performance 
cat >>/etc/sysctl.conf << EOF
vm.overcommit_memory=1
vm.overcommit_ratio=90
EOF
sysctl -p

# Remove exit 0 from the top
sed -i 's/exit 0//' /etc/rc.local

cat >>/etc/rc.local << EOF
# CPU Max Performance
echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

# Dynamically set Max CPU Frequencies 
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
exit 0
EOF

# Make Executable
chmod 755 /etc/rc.local
sh /etc/rc.local

sudo cpufreq-set -g powersave
cpufreq-info 
cat /proc/cpuinfo |grep MHz|uniq

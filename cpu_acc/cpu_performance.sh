sudo cpufreq-set -g performance
cpufreq-info 
cat /proc/cpuinfo |grep MHz|uniq

#!/bin/bash
mailto=example@contoso.com
ERR=$(cat /var/log/zabbix/zabbix_*.log | grep `date +"20%y%m%d"` | grep "FATAL\|failed" | awk '{ s = ""; for (i = 2; i <= NF; i++) s = s $i " "; print s }' | sort | uniq -c | sort -nk1 -r)
if [ -n "$ERR" ]; then
echo  "$ERR\n"| mail -v -s "$HOSTNAME zabbix error" $mailto
fi

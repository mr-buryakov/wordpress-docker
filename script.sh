#!/bin/bash

[ -z "$TYPESCRIPT" ] && TYPESCRIPT=1 exec /usr/bin/script -c "TYPESCRIPT=1  $0 $*"

################################################################################
##############searching files older than 7 days and archeive them###############
################################################################################

echo "##############searching files older than 7 days and archeive them###############";
find ./logs/ -mtime +7 -type f | xargs tar -czvf /logs/nginx_archieve_logs_$(date +%F).tar.gz

########################################################################
##############analyze amount of logs contains 5xx th codes##############
########################################################################

echo "##############analyze amount of logs contains 5xx th codes##############";
cd logs && grep 500 access.log | wc -l #| tee script.sh.log | cd - && cat script.sh.log


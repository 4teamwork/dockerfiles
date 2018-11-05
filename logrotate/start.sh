#!/bin/sh

PATH_LOGFILES="${PATH_LOGFILES:?Files for rotating must be given}"
COUNT_ROTATE="${COUNT_ROTATE:-4}"
FREQUENCY="${FREQUENCY:-weekly}"

cat > /etc/logrotate.conf << EOF
${PATH_LOGFILES}
{
  ${FREQUENCY}
  missingok
  compress
  notifempty
  copytruncate
  rotate ${COUNT_ROTATE}
}
EOF

if [ -z "$CRON_EXPR" ]; then
  CRON_EXPR="30 3 * * *"
  echo "CRON_EXPR environment variable is not set. Set to default: $CRON_EXPR"
else
  echo "CRON_EXPR environment variable set to $CRON_EXPR"
fi

echo "$CRON_EXPR	/usr/sbin/logrotate -v /etc/logrotate.conf" >> /etc/crontabs/root

(crond -f) & CRONPID=$!
trap "kill $CRONPID; wait $CRONPID" SIGINT SIGTERM
wait $CRONPID

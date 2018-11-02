#!/bin/sh

LOGROTATE_LOGFILES="${LOGROTATE_LOGFILES:?Files for rotating must be given}"
LOGROTATE_FILENUM="${LOGROTATE_FILENUM:-5}"

cat > /etc/logrotate.conf << EOF
${LOGROTATE_LOGFILES}
{
  weekly
  missingok
  compress
  notifempty
  copytruncate
  rotate ${LOGROTATE_FILENUM}
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

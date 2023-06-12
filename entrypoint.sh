#!/bin/sh

/usr/sbin/rsyslogd
/usr/sbin/postfix start
tail -f /var/log/mail.log
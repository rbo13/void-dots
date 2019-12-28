#!/bin/sh

USER=rbo13

exec 2>&1
exec setsid -w agetty -a $USER -n -l /usr/local/bin/autox -o $USER tty7 38400 linux
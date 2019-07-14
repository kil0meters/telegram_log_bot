#!/bin/bash
tail -fn0 "/var/log/auth.log" | \
while read LINE ; do
    MESSAGE=$(echo $LINE | awk '/Accepted publickey/ { print "New login to user " $9 " from IP " $11 "\n" $15 " " $16 }')
    if [ -n "${MESSAGE" ]; then # test if $MESSAGE is empty
        curl -X POST \
             -H 'Content-Type: application/json' \
             -d "{\"chat_id\": \"${CHAT_ID}\", \"text\": \"${MESSAGE}\"}" \
             "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"
    fi
done
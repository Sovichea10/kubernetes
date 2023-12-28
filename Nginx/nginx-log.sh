#!/bin/bash

BOT_TOKEN=${BOT_TOKEN}
CHAT_ID=${CHAT_ID}

# Specify the path to the access log file
access_log="/var/log/nginx/access.log"

sendMessage() {
    message="$1"

    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
            -d parse_mode="HTML" \
            -d "chat_id=$CHAT_ID" \
            -d "text=$message"
}
# # Tail the access log and filter entries with "status" of "404"
tail -f "$access_log" | grep -E '"status":\s*"404"' | while IFS= read -r line; do

    # Extract the desired fields
    remote_addr=$(echo "$line" | grep -oE '"remote_addr":\s*"[^"]+"' | cut -d'"' -f4)
    request=$(echo "$line" | grep -oE '"request":\s*"[^"]+"' | cut -d'"' -f4)
    http_host=$(echo "$line" | grep -oE '"http_host":\s*"[^"]+"' | cut -d'"' -f4)
    http_user_agent=$(echo "$line" | grep -oE '"http_user_agent":\s*"[^"]+"' | cut -d'"' -f4)
    time_local=$(echo "$line" | grep -oE '"time_local":\s*"[^"]+"' | cut -d'"' -f4)

    line="-------------------------------------------------"
    # Create the message content
    message="$line%0A<b>Remote Address</b>: $remote_addr %0A$line%0A<b>Request</b>: $request %0A$line%0A<b>Host</b>: $http_host %0A$line%0A<b>User Agent</b>: $http_user_agent %0A$line%0A<b>DateTime</b>: $time_local%0A$line"

    # Send Telegram message when a log entry with status 404 is found
    sendMessage "$message"

    # wait for 2 seconds next entry
    sleep 2 
done
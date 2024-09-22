#!/bin/bash

wgIP='185.200.190.62'
wgPORT=58228
wgListenPort=58229

generate_random_message() {
    length=$((RANDOM % 41 + 10))  # Random length between 10 and 50
    tr -dc '[:print:]' < /dev/urandom | head -c "$length"
}

message=$(generate_random_message)

echo -n "$message" | nc -u -p $wgListenPort $wgIP $wgPORT -w 1
echo "Message sent to $wgIP on port $wgPORT"
echo "Content: $message"

sleep 1

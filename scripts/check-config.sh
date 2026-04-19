#!/bin/bash

FILE="config/webserver.conf"

# check file exists
if [ ! -f "$FILE" ]; then
  echo "File not found!"
  exit 1
fi

# check not empty
if [ ! -s "$FILE" ]; then
  echo "File is empty!"
  exit 1
fi

# check keywords
if grep -qE "server|listen|port" "$FILE"; then
  echo "Config looks valid"
  exit 0
else
  echo "Missing important keywords!"
  exit 1
fi

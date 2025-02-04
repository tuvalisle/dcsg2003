#!/bin/bash

# Sjekker om en sti ble gitt som argument
if [ -z "$1" ]; then
  echo "Bruk: $0 <fil eller mappe>"
  exit 1
fi

# Kjører ls på den gitte filen eller mappen
ls "$1" > /dev/null 2>&1  # Undertrykker output
if [ $? -eq 0 ]; then
  echo "Exists"
else
  echo "Does not exist"
fi
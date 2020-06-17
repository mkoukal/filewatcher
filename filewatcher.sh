#!/bin/bash
LAST=`ls -l "$FILE"`
while true; do
  sleep 1
  NEW=`cksum "$FILE"`
  if [ "$NEW" != "$LAST" ]; then
    bash -c "$CMD"
    LAST="$NEW"
  fi
done


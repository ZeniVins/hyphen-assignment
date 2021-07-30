#! /bin/bash

HTTP_CODE=$( curl -s -o /dev/null -w '%{http_code}' "$@" )

# Analyze HTTP return code
if [ ${HTTP_CODE} -ne 200 ] ; then
    echo "error: application not accessible"
    exit 1
else 
    echo "success"
fi
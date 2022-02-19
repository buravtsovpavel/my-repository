#!/bin/bash
service=$(systemctl is-active nginx.service)
if [[ "$service" != "active" ]]
   then
        service nginx start
        exit 1
else
        echo "EXIT. nginx already running!"
        exit 1
fi

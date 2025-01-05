#!/bin/bash
for I in {1..3}; do
    echo "welcome to devops $I time..."
    sleep 1
    apt install -y jq
done

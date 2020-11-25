#!/usr/bin/env bash
for i in {1..254}; do
    if ping -c1 10.0.0.$i ; then
        echo 10.0.0.$i >> /tmp/hosts;
    fi;
done

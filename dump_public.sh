#!/bin/bash -eu

python3 ./exporter.py --lc |
    sed "s/\\\n/\n/g" | grep -v '^"$' | grep -v "private channel\|direct_message" | cut -d" " -f1 | tr -d '[' | tr -d ']' | tr -d '"' | tr '\n' ',' | sed "s/,$//g" |
    xargs -I {} echo python3 ./exporter.py --lu --lc --ch {} -c -r -o ./exports | tee /dev/stderr | bash



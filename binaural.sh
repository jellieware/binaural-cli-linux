#!/bin/bash

# binaural - wrapper script to create binaural beats on the fly

if [ $# -lt 3 ]; then
    echo "Binaural beat generator"
    echo "Usage: binaural basefreq offset length(s)"
    exit
fi

basefreq=$1
offset=$2
length=$3

freq2=$(bc -l <<< "$basefreq + $offset")

cmd="play -n -c 2 synth $length sin $basefreq sin $freq2 remix 1 1"

echo "$cmd"

$cmd

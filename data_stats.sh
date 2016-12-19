#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "usage: $0 input_file"
    exit 1
fi

input_file=$1
echo "input_file: ${input_file}"

line_count=$(wc -l $input_file|awk '{print $1}')
echo "total line count: ${line_count}"

cat $input_file | awk '{split($0, a, " "); print length(a) }' > /tmp/source_len.txt 
echo "stats:"
awk 'BEGIN{l=0} {l+=$1;ln=NR} END{m=l/ln; print "\tmean_len:"m;}' /tmp/source_len.txt 
awk 'BEGIN{l=0} {if($1>l){l=$1;ln=NR}} END{print "\tmax_len:"l; print "\tat line:"ln}' /tmp/source_len.txt 

#!/bin/bash
set -e

if [[ $# -ne 3 ]]; then
    echo "usage: $0 data_folder num_of_subsets output_folder"
    exit -1
fi

data_folder=$1
num_of_subsets=$2
output_folder=$3
echo "splitting ${data_folder} into ${num_of_subsets} subsets, saving to ${output_folder}"

mkdir -p "${output_folder}"

count=$(wc -l $data_folder/source|awk '{print $1}')
ln=$(echo $count/$num_of_subsets | bc)

echo  "total ${count} lines, each subset will have ${ln} lines"

echo  "splitting source language"
split -d -l $ln -a 2 $data_folder/source $output_folder/source-

echo  "splitting target language"
split -d -l $ln -a 2 $data_folder/target $output_folder/target-


for ((i=0; i<${num_of_subsets}; ++i)); do
    ii=$(printf "%02d" $i)
    paste "${output_folder}/source-${ii}" "${output_folder}/target-${ii}" > "${output_folder}/part-${ii}"
done
    
rm -f ${output_folder}/source* ${output_folder}/target*

echo "done"

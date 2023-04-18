#!/bin/sh
output=`readlink -f $(dirname $0)`/`hostname`-ccsrch-detail.log
echo "CCSRCH result detail will output in file: $output"

for i in $(ls -d /*/)
do

  if [ "$i" == "/dev/" ] || [ "$i" == "/proc/" ] || [ "$i" == "/sys/" ]; then
    continue
  fi

  echo "process: ${i}"
  ./ccsrch -o $output -a -s -m ${i} 2>/dev/null
done


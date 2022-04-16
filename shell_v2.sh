#!/bin/bash

array=()
while IFS=  read -r -d $'\0'; 
do 
  array+=("$REPLY"); 
done < <(find . -type f -name "ft_*.c" -maxdepth 1 -print0)

for i in "${array[@]}"
do
	FILE_CONTENT=`cat $i`
	if [ -z  "$(echo "$FILE_CONTENT" | egrep "^\/\* \** \*\/")" ]; then
		echo $i
		(echo -e ":Stdheader\n:wq") | vi $i
	else
		echo "$i already has 42header!"
	fi
done

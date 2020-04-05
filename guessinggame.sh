#!/bin/bash
# File: guessinggame.sh

function getfile_num {
	echo "$(ls -lR|grep "^-"|wc -l|sed 's/ //g')"
}

file_num=$(getfile_num)

echo -n "Guess how many files do we have in pwd:"
read response

while [[ $response -ne $file_num ]]
do
	if [[ $response -gt $file_num ]]
	then
		echo -n "too large, guess a smaller number:"
	else
		echo -n "too small, guess a larger number:"
	fi
	read response
done

echo "You got the right answer."

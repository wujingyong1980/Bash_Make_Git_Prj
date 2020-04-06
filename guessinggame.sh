#!/bin/bash
# File: guessinggame.sh

function getfile_num {
	echo "$(ls -la|grep "^-"|wc -l|sed 's/ //g')"
}

file_num=$(getfile_num)

echo -n "Guess how many files do we have in pwd:"
read response

# when response is not a proper number or not the correct answer, keep doing
while [[ ! $response =~ ^[1-9][0-9]*$|^0$ ]] || [[ $response -ne $file_num ]]
do
	#check if response is a proper number
	if [[ $response =~ ^[1-9][0-9]*$|^0$ ]]
	then
		if [[ $response -gt $file_num ]]
		then
			echo -n "too large, guess a smaller number:"
		else
			echo -n "too small, guess a larger number:"
		fi
	else
		echo -n "you need enter a proper number:"
	fi 
	read response
done

echo "You got the right answer."

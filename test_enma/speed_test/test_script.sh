#!/bin/bash
second=0
compiled_counter=0
FILE="tmp.cvs"
RESULT_FILE= #output file

TOTALC= #target value

echo 0 > $FILE
echo "TEST RESULT" > $RESULT_FILE
echo "[START TESTING]"

(
	while [ 1 ]; do
		#test-
		
		((compiled_counter++))
		echo "COMPILED!"
		echo $compiled_counter > $FILE
		echo $compiled_counter;
	done
)&
# GET PROCESS ID
PID=$!
(
	TIME_COUNTER=0
	while [ 1 ]; do
		if [ $(cat "$FILE") -eq $TOTALC ]; then
			kill $PID
			echo "STEST.C COMPILER COUNTER;"$TOTALC >> $RESULT_FILE
			echo "TIMER;"$TIME_COUNTER >> $RESULT_FILE
			echo "[test finish out > result.txt]"
			break
		fi
		
		((TIME_COUNTER++))
		sleep 1
	done	
) 


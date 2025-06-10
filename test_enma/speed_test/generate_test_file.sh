#!/bin/bash

out_file="stest.c"

echo "/* ENMA SPEED TEST FILE */" > $out_file
echo "" >> $out_file

for counter in $(seq 0 50000); do
    echo "int TEST_FUNCTION_$counter(int parameter) {return parameter * parameter;}" >> "$out_file"
done

echo "" >> $out_file
echo "int main() {" >> $out_file

for counter_2 in $(seq 0 50000); do
	echo "	TEST_FUNCTION_$counter_2($counter_2);" >> $out_file
done

echo "}" >> $out_file

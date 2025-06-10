#makefile

compiler = gcc
src = stest.c
out = bin/program

test = bash
g_file = generate_test_file.sh

read := $(shell cat read.txt)
read2 := $(read)

ifneq ($(read), $(read2))
	compiler := !!
else
	compiler := $(compiler)
endif

$(out): $(src)
	$(compiler) $(src) -o $(out)
	$(test) $(gfile)

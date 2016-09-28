all: seq cuda

seq:  mm-seq.c
	gcc -O3 mm-seq.c -o mm-seq -lrt

cuda: mm-cuda.cu
	nvcc -arch=sm_32 mm-cuda.cu -o mm-cuda -lcuda -lcudart

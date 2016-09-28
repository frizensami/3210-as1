CUDAFILE = $(shell date --iso=seconds)

all:  mm-seq mm-cuda

mm-seq:  mm-seq.c
	gcc -O3 mm-seq.c -o mm-seq -lrt

mm-cuda: mm-cuda.cu
	nvcc -arch=sm_32 mm-cuda.cu -o mm-cuda -lcuda -lcudart

cudatest: mm-cuda
	./mm-cuda 512 | tee tests/results-cuda-512-$(CUDAFILE).txt

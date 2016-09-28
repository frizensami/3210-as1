all:  mm-seq mm-cuda

mm-seq:  mm-seq.c
	gcc -O3 mm-seq.c -o mm-seq -lrt

mm-cuda: mm-cuda.cu
	nvcc -arch=sm_32 mm-cuda.cu -o mm-cuda -lcuda -lcudart

cudatest: cuda
	./mm-cuda 512 | tee results-cuda-512.txt

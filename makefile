CUDAFILE = $(shell date --iso=seconds)

all:  mm-seq mm-cuda unopt-mm-cuda

mm-seq:  mm-seq.c
	gcc -O3 mm-seq.c -o mm-seq -lrt

mm-cuda: mm-cuda.cu
	nvcc -arch=sm_32 mm-cuda.cu -O3 -o mm-cuda -lcuda -lcudart

unopt-mm-cuda: unopt-mm-cuda.cu
	nvcc -arch=sm_32 unopt-mm-cuda.cu -o unopt-mm-cuda -lcuda -lcudart

cudatest: mm-cuda
	./mm-cuda 512 | tee tests/results-cuda-512-$(CUDAFILE).txt

unoptcudatest: unopt-mm-cuda
	./unopt-mm-cuda 512 | tee tests/results-unopt-cuda-512-$(CUDAFILE).txt

compare: mm-cuda unopt-mm-cuda cudatest unoptcudatest


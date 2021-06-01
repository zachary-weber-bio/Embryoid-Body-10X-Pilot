#!/bin/bash

module load python/anaconda-2020.02
source activate snakemake

snakemake \
	-s Snakefile-10X-EB \
	--use-conda \
	-kp -j 12 \
	--ri \
	--cluster-config configs/cluster.json \
	-c "sbatch --mem-per-cpu={cluster.memory_per_cpu} \
		--nodes={cluster.n} \
		--time={cluster.time} \
		--ntasks-per-node={cluster.cores_per_node} \
		--partition=broadwl \
		--account=pi-nobrega \
        -o {cluster.logfile}" \
	$*

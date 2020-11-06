#!/bin/bash
#SBATCH --job-name=blas-mpi-all
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --cluster=smp # mpi, gpu and smp are available in H2P
#SBATCH --output=results/test_all.txt
#SBATCH --mem=8g
#SBATCH --time=0-01:00:00 # 6 hours walltime in dd-hh:mm format
#SBATCH --qos=short # required if walltime is greater than 3 days

module purge #make sure the modules environment is sane
module load gcc/8.2.0
module load openmpi/4.0.3
source ~/.bashrc

cd ~/SHREC-Parallel-Kernels/Serial/

./axpy
./dot
./norm
./scalar_mult


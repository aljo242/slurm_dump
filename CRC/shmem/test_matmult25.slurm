#!/bin/bash
#SBATCH --job-name=matmul-shmem
#SBATCH --nodes=25  #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --cluster=mpi # mpi, gpu and smp are available in H2P
#SBATCH --output=results/test_matmul_weak25.txt
#SBATCH --mem=8g
#SBATCH --partition=ib
#SBATCH --time=0-02:00:00 # 6 hours walltime in dd-hh:mm format
#SBATCH --qos=short # required if walltime is greater than 3 days

module load gcc/8.2.0
module load openmpi/4.0.3

cd ~/SHREC-Parallel-Kernels/OpenSHMEM

echo "Testing OpenSHMEM MatMul app"

oshrun -n 25 oshrun -x SHMEM_SYMMETRIC_SIZE=1g -np $proc main ../dataset/WebGraph-master/arabic-2005-hc.bin 22744080 >> $araFile leader $mstThreshold --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca btl ^vader,tcp,openib,uct  --mca orte_base_help_aggregate 0 ./matmul


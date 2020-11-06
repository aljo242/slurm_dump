#!/bin/bash
#SBATCH --job-name=blas-shmem-all
#SBATCH --nodes=24 #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --cluster=mpi # mpi, gpu and smp are available in H2P
#SBATCH --output=results/test_all.txt
#SBATCH --mem=8g
#SBATCH --partition=ib
#SBATCH --time=0-02:00:00 # 6 hours walltime in dd-hh:mm format
#SBATCH --qos=short # required if walltime is greater than 3 days

module purge #make sure the modules environment is sane
module load gcc/8.2.0
module load openmpi/4.0.3
source ~/.bashrc

cd ~/SHREC-Parallel-Kernels/OpenSHMEM/

#echo "NEW TEST: n = 2" 
oshrun -n 2 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 2 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 2 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 2 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 4" 
oshrun-n 4 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 4 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 4 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 4 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 8" 
oshrun-n 8 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 8 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 8 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 8 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 12" 
oshrun-n 12 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 12 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 12 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 12 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 16" 
oshrun-n 16 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 16 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 16 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 16 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 20" 
oshrun-n 20 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 20 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 20 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 20 -x SHMEM_SYMMETRIC_SIZE=1g --mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 24" 
oshrun-n 24--mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
oshrun-n 24--mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
oshrun-n 24--mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
oshrun-n 24--mca mpi_cuda_support 0 --mca spml ucx  --mca sshmem ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult


#!/bin/bash
#SBATCH --job-name=blas-mpi-all
#SBATCH --nodes=32 #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --cluster=mpi # mpi, gpu and smp are available in H2P
#SBATCH --output=results/test_all_28_32_weak.txt
#SBATCH --mem=8g
#SBATCH --partition=ib
#SBATCH --time=0-02:00:00 # 6 hours walltime in dd-hh:mm format
#SBATCH --qos=short # required if walltime is greater than 3 days

module purge #make sure the modules environment is sane
module load gcc/8.2.0
module load openmpi/4.0.3
source ~/.bashrc

cd ~/SHREC-Parallel-Kernels/MPI_RMA/

#echo "NEW TEST: n = 28" 
mpirun -n 28 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 28 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 28 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 28 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 32" 
mpirun -n 32 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 32 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 32 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 32 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult


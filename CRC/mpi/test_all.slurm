#!/bin/bash
#SBATCH --job-name=blas-mpi-all
#SBATCH --nodes=24 #number of nodes requested
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --cluster=mpi # mpi, gpu and smp are available in H2P
#SBATCH --output=results/test_all_weak.txt
#SBATCH --mem=8g
#SBATCH --partition=ib
#SBATCH --time=0-02:00:00 # 6 hours walltime in dd-hh:mm format
#SBATCH --qos=short # required if walltime is greater than 3 days

module purge #make sure the modules environment is sane
module load gcc/8.2.0
module load openmpi/4.0.3
source ~/.bashrc

cd ~/SHREC-Parallel-Kernels/MPI/

#echo "NEW TEST: n = 2" 
mpirun -n 2 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 2 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 2 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 2 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 4" 
mpirun -n 4 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 4 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 4 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 4 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 8" 
mpirun -n 8 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 8 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 8 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 8 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 12" 
mpirun -n 12 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 12 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 12 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 12 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 16" 
mpirun -n 16 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 16 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 16 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 16 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 20" 
mpirun -n 20 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 10 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 10 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 10 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

#echo "NEW TEST: n = 24" 
mpirun -n 24 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./axpy
mpirun -n 24 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./dot
mpirun -n 24 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./norm
mpirun -n 24 --mca mpi_cuda_support 0 --mca pml ucx --mca osc ucx  --mca atomic ucx --mca orte_base_help_aggregate 0 --mca btl ^vader,tcp,openib,uct   ./scalar_mult

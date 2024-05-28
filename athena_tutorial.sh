#!/bin/bash
  
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH -p cca
#SBATCH --mail-user=yjiang@flatironinstitute.org
#SBATCH --mail-type=ALL
#SBATCH -t 7-00:00:00



module load gcc
module load openmpi
module load lib/hdf5

output='/mnt/home/yjiang/ceph/AthenaTutorial/Data'

cd /mnt/home/yjiang/ceph/AthenaTutorial/athena/bin



srun -n8 athena -i ../inputs/mhd/athinput.orszag-tang output2/file_type=hdf5 mesh/nx1=512 mesh/nx2=512 meshblock/nx1=64 meshblock/nx2=64    -d $output >& $output/output.txt



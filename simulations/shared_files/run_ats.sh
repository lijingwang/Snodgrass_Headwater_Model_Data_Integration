#!/bin/bash
#SBATCH -A m2398
#SBATCH -C cpu
#SBATCH --qos=regular
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128

source /opt/cray/pe/cpe/23.03/restore_lmod_system_defaults.sh
module purge
module load PrgEnv-gnu/8.3.3
module load cray-libsci
ml cpu 
ml gcc/12.2.0
ml -t
export LD_PRELOAD=/opt/cray/pe/gcc/12.2.0/snos/lib64/libstdc++.so.6

srun -n 128 /pscratch/sd/l/lijingw/ats-1.4.1/bin/ats --xml_file="xml_transient.xml" > out.log

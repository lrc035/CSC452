#!/bin/bash
#PBS -l nodes=1:ppn=20
#PBS -l walltime=01:00:00
#PBS -N lab1_3c
#PBS -o lab1_3c.out
#PBS -e lab1_3c.err
#PBS -q workq
#PBS -A loni_cyen405
#PBS -m e
#PBS -M lrc035@latech.edu
module load matlab/r2017a
work="home/lrc035"
MATLAB_FILE="lab1_3c"
cd $work
matlab -logfile ./lab1_3c.txt -nodisplay -r $MATLAB_FILE

###################################################################################################
# This file contains the list of commands necessary to accomplish the first task (read mapping)
# in Part 2 of the Class Assignment Project.
# The full tophat2 command is given at the end for mapping the reads from the first sample.
# You will have to construct a similar command for the remaining 3 samples, making sure to output 
# the results in a different folder for each sample.


# These first 4 command lines are optional but are a suggestion about how to organize the files in your home directory 
# by keeping things in different sub-folders.

mkdir ClassProject
cd ClassProject/

mkdir Part2
cd Part2/

touch tophat.sh
gedit tophat.sh &

# Edit the file "tophat.sh" to contain this text:

#!/bin/bash

module load tophat2


# The folling command line is optional. You could run tophat from the root of your home directory (default when submiting a job) and specify the full path to the output folder.
# The advantage of using this additional "cd" command is that you can now give tophat the relative path to the output folder. 
cd /mnt/home/[your_login_name]/ClassProject/Part2

tophat2 -G /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.95.gff3 --no-novel-juncs -o tophat_15C_rep1 /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa /mnt/scratch/AppliedGenomics/RNAseq-Celegans/SRX4906657.fastq


# If you decided to skip the "cd" command, your tophat command would look like this:
# tophat2 -G /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.95.gff3 --no-novel-juncs -o /mnt/home/[your_login_name]/ClassProject/Part2/tophat_15C_rep1 /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa /mnt/scratch/AppliedGenomics/RNAseq-Celegans/SRX4906657.fastq
# or this:
# tophat2 -G /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.95.gff3 --no-novel-juncs -o ClassProject/Part2/tophat_15C_rep1 /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa /mnt/scratch/AppliedGenomics/RNAseq-Celegans/SRX4906657.fastq
# or this:
# tophat2 -G /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.95.gff3 --no-novel-juncs -o ~/ClassProject/Part2/tophat_15C_rep1 /mnt/scratch/AppliedGenomics/RNAseq-Celegans/Caenorhabditis_elegans.WBcel235.dna.toplevel.fa /mnt/scratch/AppliedGenomics/RNAseq-Celegans/SRX4906657.fastq


# After you are done editing and saving the "tophat.sh" file, you can submit it as a job by typing the following command:
qsub tophat.sh

# You can check the status of your job by typing:
qstat

# The output from qstat will give you some information about the status of your job (column: state)
# qw: this means that the job is wiating to start. Normally, your job should stay in this state only for a few seconds/minutes before moving on to the next state: r
# r: running. This means that your job is running = the system is executing the list of commands in your "tophat.sh" script file.
# The job will remain in "r" state until all the commands are done (which should take about 10 minutes for one run of tophat)
#
# Eqw or any state with "E/e" means error.
#
# You can delete/interrupt a job with the command:
qdel [job_number] 

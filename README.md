# Mpipi-Recharged
Code availability for the work "Chemically-informed coarse-graining of electrostatic forces in charge-rich biomolecular condensates"

######### Supporting code for the paper ##########

Here we include the code necessary to obtain the results in the paper.

The majority of the code requires a compiled version of LAMMPS. We used the 23 June 2022 version for these calculations running on Linux with standard libraries. 
The code for the PMF simulations requires Gromacs 2019.3 instead. 
There are seven directories in this repository. The numbered directories correspond to a summary of the different simulations we carried out, and each one contains a separate readme.txt file detailing its contents. 
The 'Reaction_files' directory, contains reaction maps used by the dynamic algorithm in several of the previous directories.

################ LAMMPS ################ Instructions on how to compile Lammps are provided at https://docs.lammps.org/Build_make.html.

1- In a clean directory, download the last version of Lammps (https://www.lammps.org/download.html) 
2- Compile the following packages first: 
a) 'make yes-MOLECULE' (Model molecular systems) 
b) 'make yes-RIGID' (Enforce rigid constraints on collections of atoms or particles.) 
3- Compile lammps including the 'pair_ljlambda.cpp' and 'pair_ljlambda.h' files to use HPS-Cation-pi potential with 'make mpi' or 'make serial' depending on whether parallelisation is desired. 
4- Copy the resulting executable file (lmp_serial or lmp_mpi) to the desired directory with all the files required to run the simulations. 
5. Run the simulation. "./lmp_serial -i input-script.lmp" 

######### GROMACS ######### Detailed instructions on how to install GROMACS are available at https://manual.gromacs.org/documentation/current/install-guide/index.html. 

Further details are provided in the readme.txt file in '1.PMF_calculations' directory to run the simulations.

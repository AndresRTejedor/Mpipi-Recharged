In order to run DC simulations and compute the phase diagram of the different multi-domain proteins, one needs the following files:

LAMMPS script: lammps_mpipiv2_v31.5_*.lmp (in ~/Scripts_Mpipi-Recharged directory)
Configuration file: *.dat (in Data directory)
Parameters to include in the script: *txt (in Scripts directory)

For each specific system (FUS, hnRNPA1, etc.) there are specific LAMMPS script, data and reaction files.

The same scripts can be used for different simulations introducing the following changes:
DC simulations: Use the script as it is only changing the temperature and choosing the corresponding data file.
Models: The different shifts employed and compared in our work are provided in the txt files and correspond to the following shifts:

Mpipi31_v1.0.txt: deltaG-G=0.70, deltaG-IDP=0.7
Mpipi31_v1.1.txt: deltaG-G=0.65, deltaG-IDP=sqrt(0.65)
Mpipi31_v1.2.txt: deltaG-G=0.65, deltaG-IDP=0.65
Mpipi31_v1.3.txt: deltaG-G=0.75, deltaG-IDP=sqrt(0.75)
Mpipi31_v1.4.txt: deltaG-G=0.75, deltaG-IDP=0.75
Mpipi31_v1.5.txt: deltaG-G=0.70, deltaG-IDP=sqrt(0.70)
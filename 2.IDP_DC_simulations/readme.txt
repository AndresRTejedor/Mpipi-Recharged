In order to run DC simulations and compute the phase diagram of the different intrisically disoredered proteins, one needs the following files:

LAMMPS script: lammps_mpipiv2_idp.lmp (in ~/Scripts_Mpipi-Recharged directory)
Configuration file: *.dat (in the corresponding Data directory)

The same scripts can be used for different simulations introducing the following changes:
DC simulations: Use the script as it is only changing the temperature and choosing the corresponding data file
DDX4: In the case of DDX4 one must change the salt concentration to 100 or 300 by changing the input variable csx
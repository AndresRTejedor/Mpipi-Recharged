In order to run DC simulations and compute the phase diagram of the different multi-domain proteins, one needs the following files:

LAMMPS script: lammps_mpipiv2_v31.5_*.lmp (in Scripts directory)
Configuration file: *_NPT310.lmp (Data files directory)
Reaction maps: map* polimer* (Reaction files directory)

For each specific system (FUS, PLD-FUS and A-LCD-hnRNPA1) there are specific LAMMPS script, data and reaction files. 

The same scripts can be used for different simulations introducing the following changes:
DC simulations: Use the script as it is only changing the temperature and choosing the corresponding data file.
DC simulations with RNA: Use the script as it is and use the correct data file from the 'Data_files_RNA' directory.

In the 'Output_example' directory, a sample DC simulation is provided for the system of FUS with RNA at 380K.
Please note that the trajectory included only represents the first chunk of the whole simulation

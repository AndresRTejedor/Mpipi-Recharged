#!/bin/bash 

cwd=$(pwd)
aa1=$1
aa2=$2
for index in $( cat windows.txt  ) ; do 
	echo $index
	dir=calculations/${aa1}_${aa2}

	# CREATE tpr file for GROMACS and submit job
	fname=$dir/solv_ions_${index}.gro
	tpr=$dir/em_${index}.tpr
	top=$dir/topol_${index}.top
	ndx=$dir/solv_ions_${index}.ndx
	mdp=setup/em.mdp
	gmx grompp -f $mdp -p $top  -r $fname -maxwarn 1000 -o $tpr -c $fname
	sleep 1
	gmx mdrun -s $tpr -deffnm $dir/em_${index} -c $dir/em_${index}.gro -nt 5 -v
	sleep 2
done

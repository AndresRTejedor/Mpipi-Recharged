#!/bin/bash 

while getopts "a:b:c:" opt; do
	echo "$opt, $OPTARG, $OPTIND"
	case $opt in
	a)
		aa1="$OPTARG"
		;;
	b)
		aa2="$OPTARG"
		;;
	:)
		echo -e "Invalid option: $OPTARG requires an argument" 1>&2

esac
done
echo $aa1, $aa2, $conc
cwd=$(pwd)
for run in 1  2 3;do
	for index in $( cat windows.txt  ) ; do 
		dir=calculations/${aa1}_${aa2}/$run/win_${index}
	

		mdir="calculations/${aa1}_${aa2}/$run"
		mkdir $mdir
		mkdir $dir
		# FORMAT submission script	
		cat a.sub > $mdir/run_${index}.sub
		echo \#SBATCH -J ga-${index} >> $dir/run_${index}.sub
		cat b.sub >> $mdir/run_${index}.sub
		echo CMD=\"mpirun -ppn \$mpi_tasks_per_node -np \$np mdrun_skylake_d -s ${dir}/umbrella_${index}.tpr -pf ${dir}/pullf${index}.xvg -px ${dir}/pullx${index}.xvg -x ${dir}/traj_${index}.xtc -o ${dir}/traj_${index}.trr\" >> $mdir/run_${index}.sub
		cat c.sub >> $mdir/run_${index}.sub

		fname=calculations/${aa1}_${aa2}/em_${index}.gro
		sleep 1
		tpr=$dir/umbrella_${index}.tpr
		top=calculations/${aa1}_${aa2}/topol_${index}.top
		ndx=calculations/${aa1}_${aa2}/win_${index}/solv_ions_${index}.ndx
		mdp=setup/umbrella.mdp
		gmx grompp -f $mdp -p $top -n $ndx -r $fname -maxwarn 1000 -o $tpr -c $fname

		sleep 1
	
	done
done

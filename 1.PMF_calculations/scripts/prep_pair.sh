#/bin/bash                                                            

aa1=$1
aa2=$2
dir=calculations/${aa1}_${aa2}
for index in $(cat windows.txt);do
	fname=$dir/newbox_${index}.gro
	old_top=$dir/topol_${aa1}_${aa2}.top
	top=$dir/topol_${index}.top
	cp $old_top $top

	out=$dir/solv_${index}.gro
	watergro=./amber03ws.ff/tip4p2005.gro
	gmx solvate -cp $fname -cs $watergro -o $out -p $top
	sleep 2
	out=$dir/solv_ions_${index}.gro
	fname=$dir/solv_${index}.gro
	mdp=setup/ions.mdp
	tpr=$dir/ions.tpr
	gmx grompp -f $mdp -c $fname -p $top -o $tpr -maxwarn 1000
	
	sleep 1
	gmx genion -s $tpr -o $out -p $top -pname NA -nname CL -conc 0.15 <<EOF
13
EOF
done	


#!/bin/bash
aa1="glu"
aa2="arg"
dir=calculations/${aa1}_${aa2}
#for i in 1.0 1.1 1.2 1.3 1.4 1.5 1.6;
for i in $(cat windows.txt);
	do
		wdir=$dir/win_${i}
		mkdir $wdir
		sleep 1
		cp $dir/em_${i}.gro $wdir/
		#cp $dir/topol_${i}_sub.top $wdir
		sleep 3	
		gmx make_ndx -f $wdir/em_${i}.gro -o $wdir/em_${i}.ndx << EOF
a 1-27
a 28-63
q
EOF
		sleep 1
#break
done
perl -i -pe "s/a_1-27/chainA/g" calculations/${aa1}_${aa2}/win_*/*.ndx
#sleep 1
perl -i -pe "s/a_28-63/chainB/g" calculations//${aa1}_${aa2}/win_*/*.ndx

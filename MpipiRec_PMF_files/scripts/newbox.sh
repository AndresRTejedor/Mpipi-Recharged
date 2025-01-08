!/bin/sh

aa1=$1
aa2=$2
pair="${aa1}_${aa2}"
dir="calculations/${pair}"

ndx="${dir}/${pair}.ndx"

#EOF
#for i in -0.05 0.0 0.05;
for i in $(cat windows.txt);
do	
	fname="${dir}/${pair}.gro"
	oname="${dir}/newconf_${i}.gro"
	gmx editconf -f $fname -o $oname -translate 0  $i 0  -n $ndx<<EOF
11
1
EOF

	sleep 1
	fname=$oname
	oname="${dir}/renumber.gro"
	gmx genconf -f $fname -o $oname -renumber
	sleep 1
	fname=$oname
	oname="${dir}/newbox_${i}.gro"
	gmx editconf -f $fname -o $oname -bt cubic -c -d 2

done

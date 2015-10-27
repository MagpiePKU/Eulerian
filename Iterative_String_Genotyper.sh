Gene=$1;
Disorder=$2;
Iterative=$3;

for Gene_Uniprot in `cat data/HUMAN_9606_idmapping.dat | grep -w $Gene | awk '{print $1}'`; do

	cat data/genemap | grep -w $Gene |grep -w -i $Disorder;
	cat data/GRshortname_NBKid_genesymbol_dzname.txt | grep -w $Gene | grep -w -i $Disorder ;

	if test $Iterative < 0
	then
		for a in `cat data/hs.string.ppi |grep -w $Gene_Uniprot|awk '{if($NF>0){print $1}}'`; do
			for b in `cat data/HUMAN_9606_idmapping.dat | grep -w $a | awk '{print $2}'`; do
				cat data/genemap | grep -v $Gene | grep -w $b | grep -w -i $Disorder ;
				cat data/GRshortname_NBKid_genesymbol_dzname.txt | grep -v $Gene | grep -w $b | grep -w -i $Disorder ;
			done;
		done;
		for a in `cat data/hs.string.ppi |grep -w $Gene_Uniprot|awk '{if($NF>0){print $2}}'`; do
        		for b in `cat data/HUMAN_9606_idmapping.dat | grep -w $a | awk '{print $2}'`; do
                        	cat data/genemap | grep -v $Gene | grep -w $b | grep -w -i $Disorder ;
				cat data/GRshortname_NBKid_genesymbol_dzname.txt | grep -v $Gene | grep -w $b | grep -w -i $Disorder ;
                	done;
        	done;
	fi
done;

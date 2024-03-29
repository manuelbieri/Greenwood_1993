docs_files=docs/assets/files

for i in "Model1_Level" "Model2_Level" "Model3_Level" "Model4_Level" "Model1_Log" "Model2_Log" "Model2a_Log" "Model3_Log" "Model4_Log" "Model4a_Log"
do
	# create output directory if necessary
	mkdir -p $docs_files/${i}

	## create images of the IRFs
	for j in "em1" "em2" "eh1" "eh2"
	do
		# convert eps-files into jpeg-images
		gs -dSAFER -dBATCH -dNOPAUSE -dPSFitPage -sDEVICE=png16m -dDEVICEWIDTHPOINTS=550 -dDEVICEHEIGHTPOINTS=430 -r360 -dGraphicsAlphaBits=4 -sOutputFile=${docs_files}/${i}/IRF_$j.jpeg models/${i}/graphs/${i}_IRF_${j}.eps
	done

	## convert dynare tex output into pdfs
	cd models/${i}/latex || exit
	# convert tex-files into pdfs
	pdflatex dynamic.tex
	pdflatex "\documentclass{article}\usepackage[a4paper,margin=1in,landscape]{geometry}\usepackage{longtable}\usepackage{booktabs}\begin{document}\input{${i}_latex_definitions}\input{${i}_latex_parameters}\end{document}"${i}
	cd ../../../

	## copy files into docs-directory
	# copy pdf-files
	mv models/${i}/latex/*.pdf $docs_files/${i}
	# copy log-files
	cp models/${i}.log docs/_includes/logs
	# copy replication of "The Effects of Adding Home Production to a Real Business Cycle Model"
	cp models/Replication_Effects_Home_RBC.csv docs/_data
done
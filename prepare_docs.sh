docs_files=docs/assets/files

for i in "Base1_Level" "Base2_Level" "MinimalHomeProduction_Level" "GeneralHomeProduction_Level"
do
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
	pdflatex "\documentclass{article}\usepackage{longtable}\usepackage{booktabs}\begin{document}\input{${i}_latex_definitions}\input{${i}_latex_parameters}\end{document}"${i}
	cd ../../../

	## copy files into docs-directory
	# copy pdf-files
	mkdir -p $docs_files/${i}
	mv models/${i}/latex/*.pdf $docs_files/${i}
	# copy log-files
	cp models/${i}.log docs/_includes/logs
done
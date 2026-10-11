$pdf_mode = 1;
$out_dir = 'build';
$aux_dir = 'build';
$pdflatex = 'pdflatex -file-line-error -interaction=nonstopmode -synctex=1 %O %S';
$bibtex = 'bibtex %O %B';
$max_repeat = 5;
$recorder = 1;

$clean_ext = 'acn acr alg bbl bcf blg fdb_latexmk fls glg glo gls glsdefs ist loa lof lot out run.xml synctex.gz toc xdy';

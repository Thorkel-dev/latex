#-----------------------------------------------------------------
# LaTeX template for a internship report front page
# Written By: Pierre-Louis GAUTIER
# Date Updated: January 05, 2022 (v1.2.5)
#-----------------------------------------------------------------

# Set default TeX file
@default_files = ("ebauches/document.tex");

# The first parameter is the name of one of the system's environment variables for search paths.
# The remaining parameters are values that should be in the variable
ensure_path( "TEXINPUTS", ".ebauches/param/:", "./schemas//:",  "./figures//:", );

# Build directory
$out_dir = "build";

# Whether to show CPU time used.
$show_time = 1;

# Whether to run silently.
$silent = 1;

# Default PDF viewer -- system dependent setting
$pdf_previewer = "start xdg-open %S";

# use pdflatex command
$pdf_mode = 1;

# Argument passed to all *latex commands
set_tex_cmds("--shell-escape -interaction=nonstopmode -file-line-error %O %S");

# GLO to GLS conversion hook
add_cus_dep("glo", "gls", 0, "makeglo2gls","eps", "pdf");
sub makeglo2gls {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $return = system "makeglossaries", $base_name;
    popd;
    return $return;
}

#
# Extension not cleaned by default:
#
# for latexmk -c
$clean_ext = "bbl synctex.gz run.xml glg glo gls ist out aux dvi log tex~ glo-abr out.ps ac, acr alg acn fdb_latexmk";
# for latexmk -C
$clean_full_ext = "build/ synctex.gz";

#
# Post process hooks
#
# at the start of compilation
$compiling_cmd = "java -jar plantuml.jar -charset UTF-8 -teps -stdrpt:1 -recursive ./schemas/**/*.plantuml ./schemas/*.plantuml";
# at the end of an unsuccessful compilation
# $failure_cmd = "";
# t the of an otherwise successful compilation that gives warnings
# $ warning_cmd = "";
# at the end of a completely successful compilation
$success_cmd = "mv build/*.pdf ./"; # Move PDF
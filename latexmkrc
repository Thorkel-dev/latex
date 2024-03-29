#-----------------------------------------------------------------
# LaTeX template for a internship report front page
# Written By: Pierre-Louis GAUTIER
# Date Updated: January 05, 2022 (v1.2.5)
#-----------------------------------------------------------------

# Set default TeX file
@default_files = ("document.tex");

# The first parameter is the name of one of the system's environment variables for search paths.
# The remaining parameters are values that should be in the variable
ensure_path("TEXINPUTS", "./param//:", "./figures//", , "./schemas//:");

# Build directory
$out_dir = ".temp";

# Whether to show CPU time used.
$show_time = 4;

# Whether to run silently.
$silent = 1;

# Default PDF viewer -- system dependent setting
$pdf_previewer = "start xdg-open %S";

# use pdflatex command
$pdf_mode = 1;

# Increase the number of rules, required by the use of pgfgantt, so the compilation succeeded at the
# first attempt
$max_repeat = 10;

# Argument passed to all *latex commands
set_tex_cmds("-file-line-error -interaction=nonstopmode -shell-escape %O %S");

# GLO to GLS conversion hook
add_cus_dep("glo", "gls", 0, "makeglo2gls");
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
$clean_ext = "bbl lol synctex.gz run.xml glg glo gls ist out aux dvi log tex~ glo-abr out.ps ac, acr alg acn fdb_latexmk";
# for latexmk -C
$clean_full_ext = "bin/* synctex.gz";

# Create the build folder before the start of the compilation
system("mkdir -p .temp/epstopdf");

#
# Post process hooks
#
# at the start of compilation
$compiling_cmd = "make eps";
# at the end of an unsuccessful compilation
# $failure_cmd = "";
# t the of an otherwise successful compilation that gives warnings
# $ warning_cmd = "";
# at the end of a completely successful compilation
$success_cmd = "mkdir -p bin && mv .temp/*.pdf bin/"; # Move PDF

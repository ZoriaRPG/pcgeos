@rem = '-*- Perl -*-';
@rem = '
@echo off

perl -S pdi.cmd %1 %2 %3 %4 %5 %6 %7 %8 %9

goto endofperl
';

#
# CDI is a Perl script to change between the Installed tree and the 
# Source tree.  
# The script figures out whether it is in the source tree or in the 
# installed tree and then creates the path for the other.  It then writes
# this path to a command file in %TEMP%, just before cdi exits, this temporary
# file is run.  
#
# The script is written this way because any directory change perl makes will 
# be undone when it exits, and I could not think of any way to pass arguments
# back from the perl process to the original command process.
#
# Normalizing "/" to "\" in result of getcwd() -- mgroeber 10/28/00
#
use Cwd;

$file = 0;

if (($#ARGV == -1) && ($ENV{TEMP})) {

    $_ = uc(getcwd());
    $_ =~ s/\//\\/g;

    $root = uc( $ENV{ROOT_DIR} );
    $root =~ s/\\/\\\\/g;
    
    if (/.*PERFORCE+.*/) {
	s/^(.*)(\\PERFORCE)(.*)/$1\\BBXENSEM$3/;
    } elsif (/.*BBXENSEM+.*/) {
	s/^(.*)(\\BBXENSEM)(.*)/$1\\PERFORCE$3/;
    }
    $_ .= "\\" . $ARGV[0];

    $otherdir = $_;

    $file = $ENV{TEMP}."\\cdir.cmd";
    open(PDI,">".$file);
    print PDI "cd ", $otherdir;
    close(PDI);

} else {
    print "usage: cdi\n";
    print "the environment variable TEMP must be set";
}

__END__
:endofperl
%TEMP%\cdir






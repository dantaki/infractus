#!/usr/bin/perl
use strict; use warnings;
#########################################################
##                                                       #
##                  RUN THIS SCRIPT FIRST!               #
##                  $ perl INSTALL.pl                    #
##                                                       #
##-------------------------------------------------------#
##                                                       #
##       THIS SCRIPT WILL MOVE THE SCRIPT AND DATA       #
##                  USED BY INFRACTUS.                   #
##                                                       #
##########################################################
my $splash='

::::::.    :::..-:::::\':::::::..    :::.       .,-:::::::::::::::::...    ::: .::::::.
;;;`;;;;,  `;;;;;;\'\'\'\' ;;;;``;;;;   ;;`;;    ,;;;\'````\';;;;;;;;\'\'\'\';;     ;;;;;;`    `
[[[  [[[[[. \'[[[[[,,==  [[[,/[[[\'  ,[[ \'[[,  [[[            [[    [[\'     [[[\'[==/[[[[,
$$$  $$$ "Y$c$$`$$$"``  $$$$$$c   c$$$cc$$$c $$$            $$    $$      $$$  \'\'\'    $
888  888    Y88 888     888b "88bo,888   888,`88bo,__,o,    88,   88    .d888 88b    dP
MMM  MMM     YM "MM,    MMMM   "W" YMM   ""`   "YUMMMMMP"   MMM    "YmmMMMM""  "YMmMY"

Validate deletions, tandem duplications, and inversions with single-reads.
Version 0.2
Author: Danny Antaki <dantaki@ucsd.edu>';
print "$splash\n\nINSTALL\n";
my $HOME = $ENV{'HOME'};
unless(-e $HOME and -d $HOME){ die "\$HOME NOT AN ENVIRONMENT VARIABLE.\n"; }
my $BASH_RC = $HOME."/.bashrc";
my $INSTALL_DIR=$HOME.'/bin';
print 'Do you wish to change the infractus install location? [y|n]'."\n".'DEFAULT: '.$INSTALL_DIR."\n";
chomp(my $install_ans = <STDIN>);
if ($install_ans eq 'y' || $install_ans =~ /yes/i || $install_ans eq 'Y') {
        print "ENTER INSTALL LOCATION PATH:\n";
        chomp($INSTALL_DIR=<STDIN>);
}
unless(-e $INSTALL_DIR and -d $INSTALL_DIR) { die "$INSTALL_DIR NOT FOUND\n"; }
my $infractus_dir = $INSTALL_DIR."/infractus/";
mkdir $infractus_dir unless -d $infractus_dir;
system("cp infractus $infractus_dir");
system("chmod 777 $infractus_dir"."infractus");
system("cp -r data/ $infractus_dir");
print "INSTALL LOCATION PATH: $INSTALL_DIR\n";
print "Do you wish the installer to prepend the infractus install location to PATH in you $BASH_RC ? [y|n]\nDefault: yes\n";
chomp (my $prepend=<STDIN>);
unless ($prepend eq 'n' || $prepend =~ /no/i || $prepend eq 'N') {
        open IN, ">>".$BASH_RC or die "$BASH_RC DOES NOT EXIST\n";
        my $pre = "export PATH=$INSTALL_DIR"."/infractus:\$PATH\n";
        my $message = "\#added by infractus installer\n";
        print "appeneding the following to $BASH_RC\n$message".$pre;
        print IN $message; print IN $pre;
        close IN;
        $message="For this change to become active, you have to open a new terminal or run the following command:
";
        print '#' x length $message,"\n$message\nsource $BASH_RC\n", '#' x length $message,"\n";
}
print "\n\nINSTALL COMPLETE\n\n";

#!/usr/bin/perl
use strict; use warnings; 
use Getopt::Long;
use Excel::Writer::XLSX;

my $help;
my $filename;
my $xlsxpath;
my $freeze_panes = 1;    # Default Freeze Panes ON
my $autofilter = 1;        # Default Autofilter ON
my $pattern = '\t';        # Default Pattern TAB

GetOptions(
    "help|h"                   => \$help,
    "filename|f=s"             => \$filename,
    "xlsxpath|x=s"             => \$xlsxpath,
    "freeze_panes|p=i"         => \$freeze_panes,
    "autofilter|a=i"           => \$autofilter,
    "pattern|s=s"              => \$pattern,
    
);

if ( $help || !$filename){
    usage_help();
}

open ( my $FH, '<', $filename ) or die "Unable to open file $filename to read: $!";
$filename =~ s/\.(.*)//g;

$xlsxpath = $xlsxpath || $filename;

######################################################################
##################    Setting Up XLSX File Settings    ###############
my $workbook = Excel::Writer::XLSX->new( "$xlsxpath.xlsx" );
my $row_count = 0;
####################    Setting up Data Format    ####################
my $regformat = $workbook->add_format();
$regformat->set_font( 'Calibri' );
$regformat->set_size(11);
$regformat->set_border();
####################    Setting up Header Format #####################
my $boldformat = $workbook->add_format();
$boldformat->set_bold();
$boldformat->set_color( 'white' );
$boldformat->set_font( 'Calibri' );
$boldformat->set_size(11);
$boldformat->set_border();
$boldformat->set_bg_color( 'red' );
##################    Setting Up Worksheet Settings    ###############
my $worksheet = $workbook->add_worksheet( 'Data' );
$worksheet->set_tab_color( 'blue' );
######################################################################
######################################################################

while ( my $line = <$FH> ){
    #######    Write headers data.
    if ( $row_count == 0 ){    
        my @headers = split( /$pattern/, $line );
        my $col_count = 0;
        foreach (@headers){
            $worksheet->write( 0, $col_count, $_, $boldformat );
            $col_count++;
        }
        $worksheet->freeze_panes( 1, 0 ) if ( $freeze_panes );                  # Freeze first row.
        $worksheet->autofilter( 0, 0, 0, $col_count-1 )  if ( $autofilter );    # Set auto filter on first row & all columns.
    }
    #######    Write rows data.
    else{
        my $col_count = 0;
        my @headers = split( /$pattern/, $line );
        foreach (@headers){
            $worksheet->write( $row_count, $col_count, $_, $regformat );
            $col_count++;
        }    
    }
    $row_count++;
}

$workbook->close();
close($FH);

sub usage_help{
    print "Required Modules:\n";
    print "* Getopt::Long\n";
    print "* Excel::Writer::XLSX\n\n";
    print "Install Modules via this command:\t cpan install Getopt::Long Excel::Writer::XLSX \n\n";
    print "USAGE: $0\n\n";
    print "\tperl $0 --filename='test' --xlsxpath=test --freeze_panes=0 --autofilter=0 --split_pattern=\\t\n\n";
    print "\tperl $0 -f='test' -x=test -p=0 -a=0 -s=\\t\n\n\n";
    
    print "Required: \n\t--filename -f : \tTAB Delimited text format filename or path!\n\n";
    print "Optional: \n\t--xlsxpath -x: \t\tIf given xlsx file will be generated with this Path, Name!\n\n";
    print "Optional: \n\t--freeze_panes -p: \tIf false xlsx file will be generated without freeze_panes!\n\n";
    print "Optional: \n\t--autofilter -a: \tIf false xlsx file will be generated without autofilter!\n\n";
    print "Optional: \n\t--pattern -s: \tSplit file using this patttern default: \\t - TAB!\n\n";
    
    exit;
}
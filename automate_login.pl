#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use WWW::Mechanize;

my $username = 'test'; 
my $password = 'test';

my $url = 'https://stackoverflow.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstackoverflow.com%2f';

# $ENV{HTTPS_PROXY} = '172.18.65.50:8080';
# $ENV{HTTP_PROXY} = '172.18.65.50:8080';

my $mech = WWW::Mechanize->new();
# $mech->proxy(['https', 'http', 'ftp'], '192.168.65.50:8080');
# $mech->proxy('http','http://192.168.65.50:8080');

$mech -> cookie_jar( HTTP::Cookies->new() );
$mech -> get( $url );
$mech->form_number('2');
$mech -> field ('email' => $username);
$mech -> field ('password' => $password);
$mech -> click ('submit-button');
print $mech-> content();

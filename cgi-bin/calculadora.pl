#!/usr/bin/perl->

# Para mi local
#/Strawberry/perl/bin/perl.exe

use strict;
use warnings;
use CGI;

my $cgi = CGI->new;
my $expresion = $cgi->param('expresion');
my $resultado;

if ($expresion =~ m/(.\d)+(.\d)/)
{
	$resultado = $1 + $2;
}

print $cgi->header('text/html');
print<<BLOCK;
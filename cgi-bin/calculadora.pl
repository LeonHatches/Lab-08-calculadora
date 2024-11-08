#!/usr/bin/perl

use strict;
use warnings;
use CGI;
use utf8;

my $cgi = CGI->new;
$cgi->charset('UTF-8');

my $expresion = $cgi->param('expresion');
my $resultado = 0.0;
my $operando1;
my $operando2;

while ($expresion =~ m/(\d+[\.\d]*\s*)\/(\s*\d+[\.\d]*)/)
{
	$operando1 = $1;
	$operando2 = $2;
	
	if ($operando1 == 0 and $operando2 == 0) {
		last;
	}

	$resultado = $operando1 / ($operando2 * 1.0);

	$expresion =~ s/(\d+[\.\d]*\s*)\/(\s*\d+[\.\d]*)/$resultado/;
}

if ( $operando1 eq 0 and $operando2 eq 0 ) {
	$resultado = 'Indeterminado';
}

else {
	while ($expresion =~ m/(\d+[\.\d]*\s*)\*(\s*\d+[\.\d]*)/)
	{
		$operando1 = $1;
		$operando2 = $2;
		
		$resultado = $operando1 * $operando2;

		$expresion =~ s/(\d+[\.\d]*\s*)\*(\s*\d+[\.\d]*)/$resultado/;
	}

	while ($expresion =~ m/(\d+[\.\d]*\s*)\+(\s*\d+[\.\d]*)/)
	{
		$operando1 = $1;
		$operando2 = $2;
		
		$resultado = $operando1 + $operando2;

		$expresion =~ s/(\d+[\.\d]*\s*)\+(\s*\d+[\.\d]*)/$resultado/;
	}

	while ($expresion =~ m/(\d+[\.\d]*\s*)\-(\s*\d+[\.\d]*)/)
	{
		$operando1 = $1;
		$operando2 = $2;
		
		$resultado = $operando1 - $operando2;

		$expresion =~ s/(\d+[\.\d]*\s*)\-(\s*\d+[\.\d]*)/$resultado/;
	}
}




print $cgi->header('text/html');
print<<BLOCK;
<!DOCTYPE html>
<html>
	<head>
		<!--fuente de letra-->
		<link
			href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
			rel="stylesheet"
			type="text/css">

		<!--CSS-->
		<link rel = "stylesheet" type = "text/css" href = "/css/style.css">

		<title>Calculadora</title>
	</head>

	<body>
		<div class="cajaAzul">
			<h1>< CALCULADORA ></h1>
		</div>

		<div class="cajaNormal">
			<h2>Ingrese su expresión matemática:</h2>
			
			<table>
				<tr>
					<th>SUMA</th><th>RESTA</th><th>MULTIPLICACIÓN</th><th>DIVISIÓN</th>
				</tr>
				<tr>
					<td>+</td><td>-</td><td>*</td><td>/</td>
				</tr>
			</table>

			<h1 style="color: #11213d;">▼</h1>
		</div>

		<div class="cajaFormu">
			<form action='calculadora.pl' method='GET'>
			<input type='text' name='expresion' class="cajaTexto">
			<input type='submit' value='CALCULAR' class="botonCalcular">
		</div>

		<div class="cajaResul">
			<h2>Resultado:</h2>
			<p class="resultado">$resultado</p>
		</div>
		
	</body>
</html>
BLOCK
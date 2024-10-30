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
<!DOCTYPE html>
<html>
	<head>
		<!--Extensión para caracteres especiales-->
		<meta charset="utf-8">

		<!--fuente de letra-->
		<link
			href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
			rel="stylesheet"
			type="text/css">

		<!--CSS-->
		<link rel = "stylesheet" type = "text/css" href = "style.css">

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
			<form action='cgi-bin/calculadora.pl' method='GET'>
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
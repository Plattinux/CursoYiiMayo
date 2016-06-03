<?php
function valor($tipo){
	
$act=$tipo;

if($tipo == '') $act='NO';
if($tipo == '1') $act='SI';

return $act;
}

$dataProvider = $_SESSION['datos_usuario']->getData();

$contador =count( $dataProvider );

$html="";

$html.='
<table>
<tr>
<td>&nbsp;<b>Usuario</b></td>
<td>&nbsp;<b>Correo</b></td>
<td>&nbsp;<b>Nombre completo</b></td>
<td>&nbsp;<b>País</b></td>
<td>&nbsp;<b>Idioma</b>n</td>
<td>&nbsp;<b>Telefono</b></td>
<td>&nbsp;<b>Sitioweb</b></td>
<td>&nbsp;<b>Biografia</b></td>
<td>&nbsp;<b>Fecha registro</b></td>
<td>&nbsp;<b>Activo</b></td>
</tr>';
$i=0;
$val=count($dataProvider);

while( $i < $val ){
	$html.='<tr>
		<td>&nbsp;'.$dataProvider[$i]['usuario'].'</td>
		<td>&nbsp;'.$dataProvider[$i]['correo'].'</td>
		<td>&nbsp;'.$dataProvider[$i]['nombre_completo'].'</td>
		<td>&nbsp;'. @$dataProvider[$i]['fkPais']['pais'].'</td>
		<td>&nbsp;'. @$dataProvider[$i]['fkIdioma']['idioma'].'</td>
		<td>&nbsp;'. $dataProvider[$i]["telefono"].'</td>
		<td>&nbsp;'. $dataProvider[$i]["sitioweb"].'</td>
		<td>&nbsp;'. $dataProvider[$i]["biografia"].'</td>
		<td>&nbsp;'. date("d/m/Y", strtotime($dataProvider[$i]["fecha_creacion"])).'</td>
		<td>&nbsp;'. valor($dataProvider[$i]["activo"]).'</td>
		';
	$html.='</tr>'; $i++;
}

$html.='</table>';
$html.= 'Total Resultados:'.$contador;

echo utf8_decode($html); ?>

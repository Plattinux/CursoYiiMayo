<?php
//print_r($datos); die();
$pdf = Yii::createComponent('application.extensions.mpdf60.mpdf');
//para validar la imagen
if($model->foto_perfil == '' or $model->foto_perfil == NULL)
$foto='add-user.png';
else
$foto= $model->foto_perfil;
$html='
<table>
<tr>
<td><img src="'.Yii::app()->baseUrl.'/images/'.$foto.'" width="120px" /></td>
<td><h1><center>'.$model->nombre_completo.'</center></h1></td>
</tr>
</table>
<hr />
<table>
<tr>
<td><b>EMAIL:</b></td>
<td>'.$model->correo.'</td>
</tr>
<tr>
<td><b>USUARIO:</b></td>
<td>'.$model->usuario.'</td>
</tr>
<tr>
<td><b>TELÉFONO:</b></td>
<td>'.$model->telefono.'</td>
</tr>
<tr>
<td><b>PAÍS:</b></td>
<td>'.$model->fkPais->pais.'</td>
</tr>
<tr>
<td><b>SE UNIÓ EN:</b></td>
<td>'.$model->fecha_creacion.'</td>
</tr>
</table>
<br />
<table align="center" style="text-align:center;width: 100%;border:0.5px solid gray; margin-bottom:1em;" border="0" cellpadding="0" cellspacing="0">
<tr style="background-color: #EEEEEE;">
<td colspan="4" style="height:40px;" align="center"><b>Datos de Twitter</b></td>
</tr>
<tr>
<td>&nbsp;<b>Tweet</b></td>
<td>&nbsp;<b>Retweet</b></td>
<td>&nbsp;<b>Siguiendo</b></td>
<td>&nbsp;<b>Seguidores</b></td>
</tr>
<tr>
<td>'.$datos[0]['tweet'].'</td>
<td>'.$datos[0]['retweet'].'</td>
<td>'.$datos[0]['seguidos'].'</td>
<td>'.$datos[0]['siguiendo'].'</td>
</tr>';
$html.='</table>';


$header='<img align="center" src="'.Yii::app()->request->baseUrl.'/images/banner.jpg" />';
$mpdf=new mPDF('win-1252','LETTER','','',15,15,25,12,5,7);
$mpdf->SetHTMLHeader($header);
$mpdf->SetFooter('Curso YII: {'.date('d-m-Y').'}|Página {PAGENO}/{nbpg}|Twitter');
//$stylesheet = file_get_contents('/var/www/intervenciones/protected/views/print/styles.css');
//$mpdf->WriteHTML($stylesheet,1);
// The parameter 1 tells that this is css/style only and no body/html/text
$mpdf->WriteHTML($html);
$mpdf->Output($model->usuario.'-cursodeyii.pdf','D');
exit;
?>

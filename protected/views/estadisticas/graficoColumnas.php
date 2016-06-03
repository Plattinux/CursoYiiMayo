<section class="row">
<div class="col-lg-12">
<h1 class="page-header"><?php echo $titulo ?></h1>
</div>
</section>
<?php
$this->widget('booster.widgets.TbHighCharts', array(
'options' => array(
'title' => array(
'text' => $titulo,
'x' => -20 //center
),
'subtitle' => array(
'text' => $subtitulo,
'x' -20
),
'chart' => array('type' => 'column'),
'xAxis' => array( 'categories'=> $categorias ),
'series' => array( array('name' => $tituloSerie, 'data' => $data ) ),
'credits' => array( 'enabled' => true, 'text' => 'Generado desde YiiTwitter en fecha: '.date("d/m/Y h:m A") ),
) ) ); ?>
<div class="form-actions">
<div class="pull-left">
	
<?php
$this->widget('booster.widgets.TbButton', array(
//'type'=>'primary',
'label' => 'Regresar al Indice de Estadisticas',
'icon' => 'glyphicon glyphicon-chevron-left',
'size' => 'large',
'context' => 'danger',
'buttonType' => 'link',
'url' => CHtml::normalizeUrl(array('index')),
));
?>

</div>
</div>

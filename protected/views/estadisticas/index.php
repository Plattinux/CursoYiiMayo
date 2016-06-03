<section class="row">
	<h1 class="page-header">Estadisticas de YiiTwitter</h1>
</section>

<section class="row" >
	<div class="col-lg-4 col-md-35">
	<div class="panel panel-info">
	<div class="panel-heading">
	<div class="row">
	<div class="col-xs-3">
	<i class="glyphicon glyphicon-stats" style=" font-size: 25px;"></i>
	</div>
	<div class="col-xs-9 text-right">
	<div><?php echo CHtml::link('Cantidad de Usuarios por País', array('estadisticas/usuariosPorPais')); ?></div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="col-lg-4 col-md-35">
	<div class="panel panel-success">
	<div class="panel-heading">
	<div class="row">
	<div class="col-xs-3">
	<i class="glyphicon glyphicon-stats" style=" font-size: 25px;"></i>
	</div>
	<div class="col-xs-9 text-right">
	<div class="huge"><?php //echo $count_unidades_habitacionales; ?></div>
	<div><?php echo CHtml::link('Cantidad de Usuarios por Fecha',
	array('estadisticas/registroUsuariosFecha')); ?></div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	<div class="col-lg-4 col-md-35">
	<div class="panel panel-danger">
	<div class="panel-heading">
	<div class="row">
	<div class="col-xs-3">
	<i class="glyphicon glyphicon-stats" style=" font-size: 25px;"></i>
	</div>
	<div class="col-xs-9 text-right">
	<div><?php echo CHtml::link('Indicadores Generales', array('estadisticas/Indicadores')); ?></div>
	</div>
	</div>
	</div>
	</div>
	</div>
</section>

<?php
$this->breadcrumbs=array(
	'Seguidors'=>array('index'),
	$model->id_seguidor,
);

$this->menu=array(
array('label'=>'List Seguidor','url'=>array('index')),
array('label'=>'Create Seguidor','url'=>array('create')),
array('label'=>'Update Seguidor','url'=>array('update','id'=>$model->id_seguidor)),
array('label'=>'Delete Seguidor','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_seguidor),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Seguidor','url'=>array('admin')),
);
?>

<h1>View Seguidor #<?php echo $model->id_seguidor; ?></h1>

<?php $this->widget('booster.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id_seguidor',
		'seguidor',
		'siguiendo',
		'fecha_creacion',
),
)); ?>

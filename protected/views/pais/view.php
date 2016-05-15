<?php
$this->breadcrumbs=array(
	'Paises'=>array('index'),
	$model->id_pais,
);

$this->menu=array(
array('label'=>'List Pais','url'=>array('index')),
array('label'=>'Create Pais','url'=>array('create')),
array('label'=>'Update Pais','url'=>array('update','id'=>$model->id_pais)),
array('label'=>'Delete Pais','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id_pais),'confirm'=>'Are you sure you want to delete this item?')),
array('label'=>'Manage Pais','url'=>array('admin')),
);
?>

<h1>View Pais #<?php echo $model->id_pais; ?></h1>

<?php $this->widget('booster.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		'id_pais',
		'pais',
),
)); ?>

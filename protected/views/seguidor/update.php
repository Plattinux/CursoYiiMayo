<?php
$this->breadcrumbs=array(
	'Seguidors'=>array('index'),
	$model->id_seguidor=>array('view','id'=>$model->id_seguidor),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Seguidor','url'=>array('index')),
	array('label'=>'Create Seguidor','url'=>array('create')),
	array('label'=>'View Seguidor','url'=>array('view','id'=>$model->id_seguidor)),
	array('label'=>'Manage Seguidor','url'=>array('admin')),
	);
	?>

	<h1>Update Seguidor <?php echo $model->id_seguidor; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
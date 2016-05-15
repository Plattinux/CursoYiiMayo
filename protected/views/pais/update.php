<?php
$this->breadcrumbs=array(
	'Paises'=>array('index'),
	$model->id_pais=>array('view','id'=>$model->id_pais),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Pais','url'=>array('index')),
	array('label'=>'Create Pais','url'=>array('create')),
	array('label'=>'View Pais','url'=>array('view','id'=>$model->id_pais)),
	array('label'=>'Manage Pais','url'=>array('admin')),
	);
	?>

	<h1>Update Pais <?php echo $model->id_pais; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
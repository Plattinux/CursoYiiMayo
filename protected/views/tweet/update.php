<?php
$this->breadcrumbs=array(
	'Tweets'=>array('index'),
	$model->id_tweet=>array('view','id'=>$model->id_tweet),
	'Update',
);

	$this->menu=array(
	array('label'=>'List Tweet','url'=>array('index')),
	array('label'=>'Create Tweet','url'=>array('create')),
	array('label'=>'View Tweet','url'=>array('view','id'=>$model->id_tweet)),
	array('label'=>'Manage Tweet','url'=>array('admin')),
	);
	?>

	<h1>Update Tweet <?php echo $model->id_tweet; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>
<?php
$this->breadcrumbs=array(
	'Seguidors'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Seguidor','url'=>array('index')),
array('label'=>'Manage Seguidor','url'=>array('admin')),
);
?>

<h1>Create Seguidor</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
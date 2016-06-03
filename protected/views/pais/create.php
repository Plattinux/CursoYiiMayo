<?php
$this->breadcrumbs=array(
	'Paises'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Pais','url'=>array('index')),
array('label'=>'Manage Pais','url'=>array('admin')),
);
?>

<h1>Create Pais</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>
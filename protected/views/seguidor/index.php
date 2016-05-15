<?php
$this->breadcrumbs=array(
	'Seguidors',
);

$this->menu=array(
array('label'=>'Create Seguidor','url'=>array('create')),
array('label'=>'Manage Seguidor','url'=>array('admin')),
);
?>

<h1>Seguidors</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>

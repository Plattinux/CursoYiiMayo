<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id_seguidor')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_seguidor),array('view','id'=>$data->id_seguidor)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('seguidor')); ?>:</b>
	<?php echo CHtml::encode($data->seguidor); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('siguiendo')); ?>:</b>
	<?php echo CHtml::encode($data->siguiendo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_creacion')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_creacion); ?>
	<br />


</div>
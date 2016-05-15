<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id_usuario')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_usuario),array('view','id'=>$data->id_usuario)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('correo')); ?>:</b>
	<?php echo CHtml::encode($data->correo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre_completo')); ?>:</b>
	<?php echo CHtml::encode($data->nombre_completo); ?>
	<br />


	<b><?php echo CHtml::encode($data->getAttributeLabel('sitioweb')); ?>:</b>
	<?php echo CHtml::encode($data->sitioweb); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('biografia')); ?>:</b>
	<?php echo CHtml::encode($data->biografia); ?>
	<br />
<?php 

if( Seguidor::model()->exists("seguidor = ". Yii::app()->user->id ." AND siguiendo = $data->id_usuario ") ){

//echo "Esta siguiendo este usuario, mostrar botón dejar de seguir";
$esvisibleseguir = 'display:none;';
$esvisibledejarseguir = 'display:true;';
}else{
	
//echo "No esta siguiendo este usuario, mostrar botón de seguir";
$esvisibleseguir = 'display:true;';
$esvisibledejarseguir = 'display:none;';
}



//Esta siguiendo este usuario, mostrar botón dejar de seguir
echo CHtml::ajaxLink('Dejar de Seguir',
Yii::app()->createUrl('seguidor/dejarSeguir' , array('id' => $data->id_usuario))
/*array(
'success'=>'js:function(string){
$("#btn-seguir-'.$data->id_usuario.'").fadeIn();
$("#btn-dejarseguir-'.$data->id_usuario.'").fadeOut();
}'
),array(
'id' => 'btn-dejarseguir-'.$data->id_usuario,
'class' => 'btn btn-info small-btn',
'style' => $esvisibledejarseguir,
'confirm'=>'Estas seguro de querer dejar de seguir a '.$data->nombre_completo.'?'
)*/);


//No esta siguiendo este usuario, mostrar botón de seguir
echo CHtml::ajaxLink('Seguir',
Yii::app()->createUrl('seguidor/seguir' , array('id' => $data->id_usuario)),
array(
        'type'      => 'GET',
'success'=>'js:function(html){
$("#btn-seguir-'.$data->id_usuario.'").fadeOut();
$("#btn-dejarseguir-'.$data->id_usuario.'").fadeIn();
}',
'return' => false
),array(
'id'=>'btn-seguir-'.$data->id_usuario,
'class'=>'btn btn-danger small-btn',
'style' => $esvisibleseguir,
));


?>

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_idioma')); ?>:</b>
	<?php echo CHtml::encode($data->fk_idioma); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_pais')); ?>:</b>
	<?php echo CHtml::encode($data->fk_pais); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fk_pregunta_secreta')); ?>:</b>
	<?php echo CHtml::encode($data->fk_pregunta_secreta); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('respuesta_secreta')); ?>:</b>
	<?php echo CHtml::encode($data->respuesta_secreta); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('telefono')); ?>:</b>
	<?php echo CHtml::encode($data->telefono); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('foto_perfil')); ?>:</b>
	<?php echo CHtml::encode($data->foto_perfil); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('imagen_fondo')); ?>:</b>
	<?php echo CHtml::encode($data->imagen_fondo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('activo')); ?>:</b>
	<?php echo CHtml::encode($data->activo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_creacion')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_creacion); ?>
	<br />

	*/ ?>

</div>

<div class="tweet" style="color: #292f33; border-left: 1px solid #bfe0ec;
border-right: 1px solid #bfe0ec;border-top: 1px solid #bfe0ec;cursor: pointer;padding: 10px;";>

<?php
echo CHtml::image(Yii::app()->baseUrl."/images/".$tweet["foto_perfil"],$tweet["foto_perfil"], 
array("style"=>"float:left;margin-left: 3px;
margin-top: 3px; border-radius: 5px;","height"=>"48", "width"=>"48") ); ?>

<b><?php echo $tweet["nombre_completo"]."</b> @".$tweet["usuario"] ?>
<br />

<?php echo $tweet["tweet"] ?>
<br />

<b><?php echo $tweet["fecha_creacion"] ?></b>
<br />

<?php echo "Retweet".$tweet["retweet"] ?>
<?php echo "Favorito".$tweet["favorito"] ?>
<?php echo "Ver Detalles".$tweet["id_tweet"] ?>

</div>

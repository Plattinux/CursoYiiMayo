<?php

class EstadisticasController extends Controller{
	
	
	public function filters() {
return array(
'accessControl', // perform access control for CRUD operations
);
}

public function accessRules() {
return array(
array('allow',
'actions' => array('index',
'usuariosPorPais','registroUsuariosFecha','indicadores'),
'users' => array('@'),
),
);
}


public function actionIndex() {
	
	$this->render('index' );
	
}

public function actionUsuariosPorPais() {
	
	$titulo = "Cantidad de Usuarios por País";
	$subtitulo = "Datos tomados hasta el ".date("d/m/Y h:m A");
	
	$consulta = Yii::app()->db->createCommand('SELECT p.id_pais, p.pais,
		(SELECT COUNT(u.id_usuario)
		FROM usuario u
		JOIN pais p2 ON p2.id_pais = u.fk_pais
		WHERE p.id_pais = p2.id_pais)::integer AS cantidad
		FROM pais p
		GROUP BY p.id_pais, p.pais
		ORDER BY p.pais')->queryAll();
		
	foreach ( $consulta as $registro ){
		$data[] = array( 'name' => $registro["pais"], 'y' => $registro["cantidad"], );
		$categoria[] = array($registro["pais"]);
	}
	
	$this->render('graficoBarras' , array( 'titulo' => $titulo, 'subtitulo' => $subtitulo,
					'datos' => $data, 'categorias' => $categoria ));
}


public function actionRegistroUsuariosFecha() {
	
$CantUsuarios = Usuario::model()->count();

$titulo = "Cantidad de Usuarios Registrados ";
$subtitulo = "Total Usuarios Registrados en YiiTwitter: ".$CantUsuarios;
$tituloSerie = 'Usuarios Registrados';

$sql = "SELECT to_char(date_trunc('day', fecha_creacion), 'DD/MM/YY') AS
	fecha,
	COUNT(id_usuario) AS cant_usuarios FROM usuario
	GROUP BY fecha
	ORDER BY fecha desc";

$consulta = Yii::app()->db->createCommand($sql);

foreach ( $consulta->queryAll() as $registro ){
	$data[] = array('name'=> $registro["fecha"], 'y' => $registro["cant_usuarios"], );
	$categoria[] = array($registro["fecha"]);
}

$this->render('graficoLineas' , array( 'titulo' => $titulo, 'subtitulo' => $subtitulo,
				'tituloSerie' => $tituloSerie, 'data' => $data, 'categorias' => $categoria ));

}
	
	
public function actionIndicadores() {

$CantUnidadHabitacional = Usuario::model()->count();

$titulo = "Indicadores Generales";
$subtitulo = "Total de Usuarios Registrados: ".$CantUnidadHabitacional;
$tituloSerie = 'Indicadores Generales';

$categorias[] = 'Cant Usuarios';
$categorias[] = 'Cant Tweets';
$categorias[] = 'Cant Retweet';
$categorias[] = 'Cant Favoritos';

$data[] = (int) Yii::app()->db->createCommand("select count(1) from usuario")->queryScalar();
//$data[] = (int) Tweet::model()->count() ;
$data[] = (int) Retweet::model()->count() ;
$data[] = (int) Favorito::model()->count() ;

$this->render('graficoColumnas' , array( 'titulo' => $titulo, 'subtitulo' => $subtitulo,
				'tituloSerie' => $tituloSerie, 'categorias' => $categorias, 'data' => $data ));

}	
	


}

?>

<?php

class TweetController extends Controller
{
/**
* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
* using two-column layout. See 'protected/views/layouts/column2.php'.
*/
public $layout='//layouts/column2';

/**
* @return array action filters
*/
public function filters()
{
return array(
'accessControl', // perform access control for CRUD operations
);
}

/**
* Specifies the access control rules.
* This method is used by the 'accessControl' filter.
* @return array access control rules
*/
public function accessRules()
{
return array(
array('allow',  // allow all users to perform 'index' and 'view' actions
'actions'=>array('index','view'),
'users'=>array('*'),
),
array('allow', // allow authenticated user to perform 'create' and 'update' actions
'actions'=>array('create','update'),
'users'=>array('@'),
),
array('allow', // allow admin user to perform 'admin' and 'delete' actions
'actions'=>array('admin','delete'),
'users'=>array('admin'),
),
array('deny',  // deny all users
'users'=>array('*'),
),
);
}

/**
* Displays a particular model.
* @param integer $id the ID of the model to be displayed
*/
public function actionView($id)
{
$this->render('view',array(
'model'=>$this->loadModel($id),
));
}

/**
* Creates a new model.
* If creation is successful, the browser will be redirected to the 'view' page.
*/
public function actionCreate()
{
$model = new Tweet;



// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);

if(isset($_POST['Tweet']))
{
$model->attributes=$_POST['Tweet'];

$model->usuario = Yii::app()->user->id ;
$model->foto = "Sin foto";

$mivariableidioma = $model->tweet;

if($model->save()){

//$modelIdioma = new Idioma; //para insertar
$modelIdioma = Idioma::model()->findByPk( 11 ); //para modificar
//$modelIdioma->idioma = "Chino Mandarin";
$modelIdioma->idioma = $mivariableidioma ;
$modelIdioma->save();

$this->redirect(array('view','id'=>$model->id_tweet));

}
}

$this->render('create',array(
'model'=>$model,
));
}

/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionUpdate($id)
{
$model=$this->loadModel($id);

// Uncomment the following line if AJAX validation is needed
// $this->performAjaxValidation($model);

if(isset($_POST['Tweet']))
{
$model->attributes=$_POST['Tweet'];
if($model->save())
$this->redirect(array('view','id'=>$model->id_tweet));
}

$this->render('update',array(
'model'=>$model,
));
}

/**
* Deletes a particular model.
* If deletion is successful, the browser will be redirected to the 'admin' page.
* @param integer $id the ID of the model to be deleted
*/
public function actionDelete($id)
{
if(Yii::app()->request->isPostRequest)
{
// we only allow deletion via POST request
$this->loadModel($id)->delete();

// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
if(!isset($_GET['ajax']))
$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
}
else
throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
}

/**
* Lists all models.
*/
/*
public function actionIndex()
{
$dataProvider=new CActiveDataProvider('Tweet');
$this->render('index',array(
'dataProvider'=>$dataProvider,
));
}
*/


public function actionIndex(){
	
$sql = "select distinct t.id_tweet, t.tweet, t.foto,
	t.usuario,u.usuario,u.nombre_completo,u.foto_perfil, t.fecha_creacion,
	( select count(1) from retweet r where r.retweet = t.id_tweet ) as retweet,
	( select count(1) from favorito f where f.favorito = t.id_tweet ) as favorito
	from tweet as t
	join seguidor as s on s.siguiendo = t.usuario and s.seguidor = ".Yii::app()->user->id."
	join usuario as u on u.id_usuario = t.usuario
	order by t.id_tweet desc";

$consulta = Yii::app()->db->createCommand( $sql );
$losTweets = $consulta->queryAll( );

$this->render('index', array( 'losTweets' => $losTweets,));

}

/**
* Manages all models.
*/
public function actionAdmin()
{
$model=new Tweet('search');
$model->unsetAttributes();  // clear any default values
if(isset($_GET['Tweet']))
$model->attributes=$_GET['Tweet'];

$this->render('admin',array(
'model'=>$model,
));
}

/**
* Returns the data model based on the primary key given in the GET variable.
* If the data model is not found, an HTTP exception will be raised.
* @param integer the ID of the model to be loaded
*/
public function loadModel($id)
{
$model=Tweet::model()->findByPk($id);
if($model===null)
throw new CHttpException(404,'The requested page does not exist.');
return $model;
}

/**
* Performs the AJAX validation.
* @param CModel the model to be validated
*/
protected function performAjaxValidation($model)
{
if(isset($_POST['ajax']) && $_POST['ajax']==='tweet-form')
{
echo CActiveForm::validate($model);
Yii::app()->end();
}
}
}

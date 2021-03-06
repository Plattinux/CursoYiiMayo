<?php

class UsuarioController extends Controller
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
			'postOnly + delete', // we only allow deletion via POST request
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
				'users'=>array('@'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update', 'miPropiaAccion', 'pdf', 'excel'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}



public function actionPdf($id){
	
	$model = $this->loadModel( $id );
	
	$datos='select (select count (*) from tweet where usuario='.$id.') as tweet,
		(select count (*) from retweet where usuario='.$id.') as retweet,
		(select count (*) from seguidor where seguidor='.$id.') as seguidos,
		(select count (*) from seguidor where siguiendo='.$id.') as siguiendo';
	
	$consulta = Yii::app()->db->createCommand( $datos );
	$losTweets = $consulta->queryAll();
	
	$this->render('informePDF', array( 'model' => $model, 'datos' => $losTweets ) );
	
}


public function actionExcel(){
	
yii::app()->request->sendFile("listado_usuario.xls",
$this->renderPartial('reporte_excel',array(), true));

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
		$model=new Usuario;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Usuario']))
		{
			
			$model->attributes=$_POST['Usuario'];
			
			$model->foto_perfil=CUploadedFile::getInstance($model,'foto_perfil');
			$model->password=md5($model->password);
			
			
			if($model->save()){
				
				#$model->foto_perfil->saveAs(Yii::getPathOfAlias('webroot')."/images/".$model->foto_perfil);

				if(!empty($model->foto_perfil)){
					$model->foto_perfil->saveAs( Yii::getPathOfAlias('webroot')."/images/".$model->foto_perfil );
				}

				$this->redirect(array('view','id'=>$model->id_usuario));
				
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

		if(isset($_POST['Usuario']))
		{
			$model->attributes=$_POST['Usuario'];
			$model->password=md5($model->password);
			
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_usuario));
		}

		$this->render('actualizar',array(
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
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Usuario');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}


	public function actionMiPropiaAccion($id)
	{
		
		$var ="Aqui cambiamos nuestra clave";

		$fecha = date( "d / m /Y");
		
		$a = 5;
		$b = 10;
		$c = $a + $b;
		
		$misusuarios=$this->loadModel( $id );
		

		
		$this->render( 'mivista',array('variable' => $var, 'mifecha' => $fecha, 
						'calculo'=> $c, 'usuario'=>$misusuarios) );
	}
	
	
	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Usuario('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Usuario']))
			$model->attributes=$_GET['Usuario'];

$mivariable = 'Hola Curso de Yii '.date("d / m / Y");
		$this->render('admin',array(
			'model'=>$model,'variable_curso' => $mivariable
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Usuario the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Usuario::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Usuario $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='usuario-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}

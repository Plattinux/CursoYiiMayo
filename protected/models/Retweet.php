<?php

/**
 * This is the model class for table "retweet".
 *
 * The followings are the available columns in table 'retweet':
 * @property integer $id_retweet
 * @property integer $retweet
 * @property integer $usuario
 * @property string $fecha_creacion
 *
 * The followings are the available model relations:
 * @property Tweet $retweet0
 * @property Usuario $usuario0
 */
class Retweet extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'retweet';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('retweet, usuario', 'required'),
			array('retweet, usuario', 'numerical', 'integerOnly'=>true),
			array('fecha_creacion', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_retweet, retweet, usuario, fecha_creacion', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'retweet0' => array(self::BELONGS_TO, 'Tweet', 'retweet'),
			'usuario0' => array(self::BELONGS_TO, 'Usuario', 'usuario'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_retweet' => 'Id Retweet',
			'retweet' => 'Retweet',
			'usuario' => 'Usuario',
			'fecha_creacion' => 'Fecha Creacion',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_retweet',$this->id_retweet);
		$criteria->compare('retweet',$this->retweet);
		$criteria->compare('usuario',$this->usuario);
		$criteria->compare('fecha_creacion',$this->fecha_creacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Retweet the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

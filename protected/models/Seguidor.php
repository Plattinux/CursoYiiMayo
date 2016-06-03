<?php

/**
 * This is the model class for table "seguidor".
 *
 * The followings are the available columns in table 'seguidor':
 * @property integer $id_seguidor
 * @property integer $seguidor
 * @property integer $siguiendo
 * @property string $fecha_creacion
 *
 * The followings are the available model relations:
 * @property Usuario $seguidor0
 * @property Usuario $siguiendo0
 */
class Seguidor extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'seguidor';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('seguidor, siguiendo', 'required'),
			array('seguidor, siguiendo', 'numerical', 'integerOnly'=>true),
			array('fecha_creacion', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_seguidor, seguidor, siguiendo, fecha_creacion', 'safe', 'on'=>'search'),
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
			'seguidor0' => array(self::BELONGS_TO, 'Usuario', 'seguidor'),
			'siguiendo0' => array(self::BELONGS_TO, 'Usuario', 'siguiendo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_seguidor' => 'Id Seguidor',
			'seguidor' => 'Seguidor',
			'siguiendo' => 'Siguiendo',
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

		$criteria->compare('id_seguidor',$this->id_seguidor);
		$criteria->compare('seguidor',$this->seguidor);
		$criteria->compare('siguiendo',$this->siguiendo);
		$criteria->compare('fecha_creacion',$this->fecha_creacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Seguidor the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

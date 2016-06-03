<?php

/**
 * This is the model class for table "tweet".
 *
 * The followings are the available columns in table 'tweet':
 * @property integer $id_tweet
 * @property string $tweet
 * @property string $foto
 * @property integer $usuario
 * @property string $fecha_creacion
 *
 * The followings are the available model relations:
 * @property Favorito[] $favoritos
 * @property Retweet[] $retweets
 * @property Usuario $usuario0
 */
class Tweet extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tweet';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tweet, usuario', 'required'),
			array('usuario', 'numerical', 'integerOnly'=>true),
			array('tweet', 'length', 'max'=>140),
			array('foto', 'length', 'max'=>50),
			array('fecha_creacion', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_tweet, tweet, foto, usuario, fecha_creacion', 'safe', 'on'=>'search'),
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
			'favoritos' => array(self::HAS_MANY, 'Favorito', 'favorito'),
			'retweets' => array(self::HAS_MANY, 'Retweet', 'retweet'),
			'usuario0' => array(self::BELONGS_TO, 'Usuario', 'usuario'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_tweet' => 'Id Tweet',
			'tweet' => 'Tweet',
			'foto' => 'Foto',
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

		$criteria->compare('id_tweet',$this->id_tweet);
		$criteria->compare('tweet',$this->tweet,true);
		$criteria->compare('foto',$this->foto,true);
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
	 * @return Tweet the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}

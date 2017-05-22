<?php

/**
 * This is the model class for table "lb_notees".
 *
 * The followings are the available columns in table 'lb_notees':
 * @property integer $lb_record_primary_key
 * @property string $lb_note_name
 * @property string $lb_note_value
 * @property integer $lb_note_is_default
 */
class LbNote extends CLBActiveRecord
{
    const LB_NOTE_IS_DEFAULT = 1;
    const LB_NOTE_IS_NOT_DEFAULT = 0;
    var $record_title_column_name = 'lb_note_name';
    var $module_name = 'lbInvoice';

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'lb_notes';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('lb_note_name, lb_note_value, lb_note_is_default', 'required'),
			array('lb_note_is_default', 'numerical', 'integerOnly'=>true),
			array('lb_note_name', 'length', 'max'=>60),
			array('lb_note_value', 'length', 'max'=>10),
//                        array('lb_note_name','unique','message'=>'note Name exist'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('lb_record_primary_key, lb_note_name, lb_note_value, lb_note_is_default', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'lb_record_primary_key' => 'Lb Record Primary Key',
			'lb_note_name' => 'Note Name',
			'lb_note_value' => 'Note Value ',
			'lb_note_is_default' => 'Add as a default note',
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

		$criteria->compare('lb_record_primary_key',$this->lb_record_primary_key);
		$criteria->compare('lb_note_name',$this->lb_note_name,true);
		$criteria->compare('lb_note_value',$this->lb_note_value,true);
		$criteria->compare('lb_note_is_default',$this->lb_note_is_default);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return LbNote the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * Get notees that this subscriber has - usually to generate a dropdown
     * so that users can choose for a specific invoice
     *
     * @param $invoice_id
     * @param $return_type
     * @return array|CActiveDataProvider|string
     */
    public function getNotes($sort = "", $return_type = self::LB_QUERY_RETURN_TYPE_ACTIVE_DATA_PROVIDER)
    {
        $criteria=new CDbCriteria;
        $criteria->order = $sort;
        $dataProvider = $this->getFullRecordsDataProvider($criteria);

        return $this->getResultsBasedForReturnType($dataProvider, $return_type);
    }

    /**
     * Get the default note for current subscription
     *
     * @return null if no note found.
     */
    public function getDefaultnote()
    {
        $notees = $this->getnotees("", self::LB_QUERY_RETURN_TYPE_MODELS_ARRAY);

        // if there's only one note
        // then use that as default
        if (count($notees) == 1)
            return $notees[0];

        // else look for default
        foreach($notees as $note_item)
        {
            if ($note_item->lb_note_is_default == $this::LB_NOTE_IS_DEFAULT)
                return $note_item;
        }

        // none found, return null
        return null;
    }
    
    public function IsNamenote($name_note,$note_id=false) {
        
        $criteria=new CDbCriteria;
        
        if($note_id)
            $criteria->condition='t.lb_record_primary_key != '.  intval($note_id);

        $notees = $this->getFullRecordsDataProvider($criteria);
        
        foreach ($notees->data as $note_item) {
            if($name_note==$note_item->lb_note_name)
                return false;
        }
        return true;
    }
    
    public function IsnoteExistInvoiceORQuotation($note_id)
    {
        // $note_invoice = LbInvoiceItem::model()->find('lb_invoice_item_description='.$note_id);
        // $note_quotation = LbQuotationnote::model()->find('lb_quotation_note_id='.$note_id);
        
        // if(count($note_quotation)>0 || count($note_invoice)>0)
        //     return true;
        return false;
    }
}

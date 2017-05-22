<?php
/* @var $this DefaultController */
/* @var $model Lbnote */
/* @var $form CActiveForm */

echo "<h1>New note</h1>";
$form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
    'id'=>'lb-note-form',
    //'action'=>$model->getActionURLNormalized('createnote'),
    // Please note: When you enable ajax validation, make sure the corresponding
    // controller action is handling ajax validation correctly.
    // There is a call to performAjaxValidation() commented in generated controller code.
    // See class documentation of CActiveForm for details on this.
    'enableAjaxValidation'=>false,
    'type'=>'horizontal',
    //'htmlOptions'=>array('class'=>'well'),
));

echo '<p class="note">Fields with <span class="required">*</span> are required.</p>';
if($error!="")
{
    echo '<div class="alert alert-block alert-error">';
        echo $error;
    echo '</div>';
}
echo $form->textFieldRow($model,'lb_note_name');
echo $form->textFieldRow($model, 'lb_note_value');
echo $form->checkBoxRow($model,'lb_note_is_default');

    LBApplicationUI::submitButton('Save', array(
        'url'=> $this->createUrl('createNote'),
        'ajaxOptions'=>array(
            'id' => 'ajax-submit-form-new-note-' . uniqid(),
            'beforeSend' => 'function(data){
				if ($("#Lbnote_lb_note_name").val() == "" ||
				    $("#Lbnote_lb_note_value").val() == "")
				{
				    alert("Please fill in the required fields.");
                    return false;
				}

				return true;
			} ',
        ),
        'htmlOptions'=>array(
            'style'=>'margin-left: auto; margin-right: auto',
            'id'=>'ajax-btn-new-note',
            'live'=>false,
        ),
    ));

$this->endWidget(); // and form
?>

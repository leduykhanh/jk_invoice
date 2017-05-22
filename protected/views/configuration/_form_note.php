<?php
    // Buttons
    echo '<div class="btn-toolbar">';
    LBApplicationUI::newButton('New Note', array(
            'url'=>$this->createUrl('createNote'),
    ));
    echo '</div>';
    
    $this->widget('bootstrap.widgets.TbGridView',array(
        'id'=>'lb_note_grid',
        'template' => "{items}\n{pager}\n{summary}",
        'dataProvider'=>$noteModel,
        'columns'=>array(
            array(
                'name'      =>'lb_note_name',
                'header'    =>'Note Name',
                'value'     =>'$data->lb_note_name',
            ),
            array(
                'name'      =>'lb_note_value',
                'header'    =>'Value',
                'value'     =>'$data->lb_note_value',
            ),
            array(
                'name'      =>'lb_note_is_default',
                'header'    =>'Note Default',
                'value'     =>'$data->lb_note_is_default',
            ),
//            array(
//                 'class' => 'editable.EditableColumn',
//                    'header'    =>'note Default',
//                    'name' => 'lb_note_is_default',
//                    'editable' => array(
//                        'type' => 'select',
//                        'url' => Lbnote::model()->getActionURL('ajaxUpdateFieldnote'),
//                        'source'=>array(1=>1,2=>2),
//                        'placement' => 'right',
//                   )
//            ),
           array(
                'class'=>'CButtonColumn',
                    'template'=>'{update}{delete}',
                    'buttons'=>array(
                       'delete'=>array(
                           'url'=>'Yii::app()->createUrl("/configuration/deletenote",array("id"=>$data->lb_record_primary_key))',
                           'visible'=>'Lbnote::model()->IsnoteExistInvoiceORQuotation($data->lb_record_primary_key)==false',
                        ),
                       'update'=>array(
                           'url'=>'Yii::app()->createUrl("/configuration/updatenote",array("id"=>$data->lb_record_primary_key))',
                           'visible'=>'Lbnote::model()->IsnoteExistInvoiceORQuotation($data->lb_record_primary_key)==false',
                       )
                    ),
            ),
        ),
    ));
?>

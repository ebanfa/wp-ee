<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
	global $sb_post_type;
?>


<form role="form" name="<?php echo $sb_post_type;?>_form" 
      id="<?php echo $sb_post_type;?>_form" action="" 
      method="POST" enctype="multipart/form-data" 
      data-bv-framework="bootstrap"
      data-bv-message="This value is not valid"
      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">


<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php bloginfo('name'); ?></title>
    <link rel="stylesheet" type="text/css" media="all" href="<?php bloginfo('stylesheet_url'); ?>" />
    <!-- Include this so that wordpress will load our enqueued scripts -->
    <?php 
        wp_head(); 
        $header_color = get_option('cp_default_portal_header_color');
        if(EntityStringUtils::is_invalid_string($header_color)) $header_color = '#00BCD4';
    ?>

    <style type="text/css">
        body.login-content::before {
            background: <?php echo $header_color; ?> none repeat scroll 0% 0%;
        }
    </style>

</head>

<body <?php body_class('login-content'); ?>>
    <!-- Login -->
    <div class="lc-block toggled signup" id="l-register">
        <form id="signup-form" class="form-signup" method="POST"
              data-bv-framework="bootstrap"
              data-bv-message="This value is not valid"
              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">

            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-person"></i></span>
                <div class="fg-line">
                    <input name="first_name" id="first_name" type="text" 
                        value="" class="form-control" 
                        placeholder="First name"
                        data-bv-message="The first name is not valid" 
                        data-bv-emailaddress-message="The input is not a valid name" required/>
                </div>
            </div>

            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-person"></i></span>
                <div class="fg-line">
                    <input name="last_name" id="last_name" type="text" 
                           value="" class="form-control" 
                           placeholder="Last name"
                           data-bv-message="The last name is not valid" 
                           data-bv-emailaddress-message="The input is not a valid name" required/>
                </div>
            </div>

            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-person"></i></span>
                <div class="fg-line">
                    <input name="email" id="email" type="email" 
                           value="" class="form-control" 
                           placeholder="Email address"
                           data-bv-message="The email is not valid" 
                           data-bv-emailaddress-message="The input is not a valid email address" required/>
                </div>
            </div>

            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-lock-outline"></i></span>
                <div class="fg-line">
                    <input name="password" id="password" type="password" value="" 
                           class="form-control" 
                           placeholder="Password" 
                           data-bv-notempty="true"
                           data-bv-notempty-message="The password is required and cannot be empty"
                           data-bv-identical="true"
                           data-bv-identical-field="confirm_password"
                           data-bv-identical-message="The password and its confirm are not the same"/>
                </div>
            </div>
            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-lock-outline"></i></span>
                <div class="fg-line">
                    <input name="confirm_password" id="confirm_password" type="password" value="" 
                           class="form-control" 
                           placeholder="Confirm password"
                           data-bv-notempty="true"
                           data-bv-notempty-message="The confirm password is required and cannot be empty"
                           data-bv-identical="true"
                           data-bv-identical-field="password"
                           data-bv-identical-message="The password and its confirm are not the same"/>
                </div>
            </div>
            <div class="form-group input-group m-b-20">
                <span class="input-group-addon"><i class="md md-lock-outline"></i></span>
                <div class="fg-line">
                    <select id="user_type" name="user_type" class="form-control">
                        <option value="student">I am a student</option>
                        <option value="tutor"> I am a tutor</option>
                    </select>
                </div>
            </div>

            <div class="clearfix"></div>
            <?php wp_nonce_field('post_nonce', 'post_nonce_field'); ?>
            <input type="hidden" name="artifact" id="artifact" value="signup" />   
            <input type="hidden" name="submitted" id="submitted" value="true" />  
            <input type="hidden" name="edit_mode" value="create" /> 

            <button class="btn btn-login btn-danger btn-float">
                <i class="zmdi zmdi-arrow-forward"></i>
            </button>
        </form>
        <div id="success"></div>

        <ul class="login-navigation">
            <li data-block="#l-register" class="bgm-red">
                <a href="<?php echo ArtifactRequestProcessorUtils::get_artifact_url('signin');?>">Login</a>
            </li>
            <li data-block="#l-forget-password" class="bgm-orange">
                <a href="<?php echo ArtifactRequestProcessorUtils::get_artifact_url('password');?>">Forgot Password?</a>
            </li>
        </ul>
    </div>

    <!-- Older IE warning message -->
    <!--[if lt IE 9]>
        <div class="ie-warning">
            <h1 class="c-white">IE SUCKS!</h1>
            <p>You are using an outdated version of Internet Explorer, upgrade to any of the following web browser <br/>in order to access the maximum functionality of this website. </p>
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="img/browsers/chrome.png" alt="">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="img/browsers/firefox.png" alt="">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="img/browsers/opera.png" alt="">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="img/browsers/safari.png" alt="">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="img/browsers/ie.png" alt="">
                        <div>IE (New)</div>
                    </a>
                </li>
            </ul>
            <p>Upgrade your browser for a Safer and Faster web experience. <br/>Thank you for your patience...</p>
        </div>   
    <![endif]-->
<script type="text/javascript">
    jQuery(document).ready(function ($)
    {   

        $('#signup-form').bootstrapValidator().on('success.form.bv', function (e)
        {
            e.preventDefault();
            var $form = $(e.target), 
            formData = new FormData(), 
            params = $form.serializeArray();
            // Copy other params from the form into the formData
            $.each(params, function(i, val) {
                formData.append(val.name, val.value);
            });
            // As required by wordpress
            formData.append('action', 'create_entity_ajax');
            swal({title: "Please wait!", text: "Your request is being processed", showConfirmButton: false });
            // Make the Ajax call
            $.ajax({
                url: '<?php echo admin_url('admin-ajax.php'); ?>',
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                type: 'POST',
                success: function(responseData) {
                    if (responseData.success) {

                        swal({   
                            title: "Great Job!",   
                            text: "Your account has been created. Click OK to proceed",   
                            showCancelButton: false,   
                            closeOnConfirm: true 
                        }, function(){   
                            document.location.href=responseData.data.message;
                        });
                    }
                    else {
                        swal({   
                            title: "Oops!",   
                            text: responseData.data.message,   
                            type: "warning",   
                            showCancelButton: false,   
                            closeOnConfirm: true 
                        });
                    }
                }
            });
        });

    });
</script>
</body>
</html>
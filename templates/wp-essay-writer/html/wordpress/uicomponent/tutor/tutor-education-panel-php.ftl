<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }
    $view = $_REQUEST['page_info']['view'];
    $model = $view->get_model();
?>
<div role="tabpanel" class="tab-pane animated fadeIn in" id="tab-education">
    <div class="list-group lg-odd-black">
        <div class="lv-header-alt clearfix">
            <ul class="lv-actions actions artifact-actions">
                <li>
                    <a data-toggle="modal" href="#party-education-modal" >
                        <i class="zmdi zmdi-plus zmdi-hc-fw"></i>
                    </a>
                </li>
            </ul>
        </div>
        <?php foreach ($model['education'] as $key => $education) { ?>
        <div class="list-group-item media">
            <div class="pull-right">
                <div class="actions dropdown">
                    <a href="list-view.html" data-toggle="dropdown" aria-expanded="true">
                        <i class="zmdi zmdi-more-vert"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li>
                            <a href="#">Delete</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="media-body">
                <div class="lgi-heading"><?php echo $education['name']; ?></div>
            </div>
        </div><!-- List item -->
        <?php } ?>
    </div> <!-- List group -->
</div>
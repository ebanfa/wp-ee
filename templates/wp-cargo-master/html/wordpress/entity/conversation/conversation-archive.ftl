<?php
    /*
     */
    if (!defined('ABSPATH')) {
        exit; // Exit if accessed directly
    }

    $view = $_REQUEST['page_info']['view'];
    $model = $view->get_model();


?>
<div class="card m-b-0" id="messages-main">
    <div class="ms-menu">
        <!-- <div class="ms-block">
            <div class="ms-user">
                <img src="img/profile-pics/1.jpg" alt="">
                <div>Signed in as <br/> m-hollaway@gmail.com</div>
            </div>
        </div> -->
        <div class="ms-block">
            <div class="dropdown">
                <a class="btn btn-primary btn-block" href="#">Conversations</a>
            </div>
        </div>
        
        <div id="conversation-list" class="listview lv-user m-t-20">
            <div class="lv-item media active">
                <div class="lv-avatar pull-left">
                    <img src="img/profile-pics/1.jpg" alt="">
                </div>
                <div class="media-body">
                    <div class="lv-title">Davil Parnell</div>
                    <div class="lv-small">Fierent fastidii recteque ad pro</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar bgm-red pull-left">a</div>
                <div class="media-body">
                    <div class="lv-title">Ann Watkinson</div>
                    <div class="lv-small">Cum sociis natoque penatibus </div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar bgm-orange pull-left">m</div>
                <div class="media-body">
                    <div class="lv-title">Marse Walter</div>
                    <div class="lv-small">Suspendisse sapien ligula</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar pull-left">
                    <img src="img/profile-pics/2.jpg" alt="">
                </div>
                <div class="media-body">
                    <div class="lv-title">Jeremy Robbins</div>
                    <div class="lv-small">Phasellus porttitor tellus nec</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar pull-left">
                    <img src="img/profile-pics/3.jpg" alt="">
                </div>
                <div class="media-body">
                    <div class="lv-title">Reginald Horace</div>
                    <div class="lv-small">Quisque consequat arcu eget</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar bgm-cyan pull-left">s</div>
                <div class="media-body">
                    <div class="lv-title">Shark Henry</div>
                    <div class="lv-small">Nam lobortis odio et leo maximu</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar bgm-purple pull-left">p</div>
                <div class="media-body">
                    <div class="lv-title">Paul Van Dack</div>
                    <div class="lv-small">Nam posuere purus sed velit auctor sodales</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar pull-left">
                    <img src="img/profile-pics/4.jpg" alt="">
                </div>
                <div class="media-body">
                    <div class="lv-title">James Anderson</div>
                    <div class="lv-small">Vivamus imperdiet sagittis quam</div>
                </div>
            </div>
            
            <div class="lv-item media">
                <div class="lv-avatar pull-left">
                    <img src="img/profile-pics/6.jpg" alt="">
                </div>
                <div class="media-body">
                    <div class="lv-title">Kane Williams</div>
                    <div class="lv-small">Suspendisse justo nulla luctus nec</div>
                </div>
            </div>
        </div>

        
    </div>
    
    <div class="ms-body">
        <div class="listview lv-message">
            <div class="lv-header-alt clearfix">
                <div id="ms-menu-trigger">
                    <div class="line-wrap">
                        <div class="line top"></div>
                        <div class="line center"></div>
                        <div class="line bottom"></div>
                    </div>
                </div>

                <div class="lvh-label hidden-xs">
                    <div class="lv-avatar pull-left">
                        <img src="img/profile-pics/1.jpg" alt="">
                    </div>
                    <span class="c-black">David Parbell</span>
                </div>
                
                <ul class="lv-actions actions">
                    <li>
                        <a href="messages.html">
                            <i class="zmdi zmdi-delete"></i>
                        </a>
                    </li>
                    <li>
                        <a href="messages.html">
                            <i class="zmdi zmdi-check"></i>
                        </a>
                    </li>
                    <li>
                        <a href="messages.html">
                            <i class="zmdi zmdi-time"></i>
                        </a>
                    </li>
                    <li class="dropdown">
                        <a href="messages.html" data-toggle="dropdown" aria-expanded="true">
                            <i class="zmdi zmdi-sort"></i>
                        </a>
            
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="messages.html">Latest</a>
                            </li>
                            <li>
                                <a href="messages.html">Oldest</a>
                            </li>
                        </ul>
                    </li>                             
                    <li class="dropdown">
                        <a href="messages.html" data-toggle="dropdown" aria-expanded="true">
                            <i class="zmdi zmdi-more-vert"></i>
                        </a>
            
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a href="messages.html">Refresh</a>
                            </li>
                            <li>
                                <a href="messages.html">Message Settings</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <div id="message-list" class="lv-body">                                    
                <div class="lv-item media">
                    <div class="lv-avatar pull-left">
                        <img src="img/profile-pics/1.jpg" alt="">
                    </div>
                    <div class="media-body">
                        <div class="ms-item">
                            Quisque consequat arcu eget odio cursus, ut tempor arcu vestibulum. Etiam ex arcu, porta a urna non, lacinia pellentesque orci. Proin semper sagittis erat, eget condimentum sapien viverra et. Mauris volutpat magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu massa a sem pulvinar lobortis.
                        </div>
                        <small class="ms-date"><i class="zmdi zmdi-time"></i> 20/02/2015 at 09:00</small>
                    </div>
                </div>
                
                <div class="lv-item media right">
                    <div class="lv-avatar pull-right">
                        <img src="img/profile-pics/8.jpg" alt="">
                    </div>
                    <div class="media-body">
                        <div class="ms-item">
                            Mauris volutpat magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu massa a sem pulvinar lobortis.
                        </div>
                        <small class="ms-date"><i class="zmdi zmdi-time"></i> 20/02/2015 at 09:30</small>
                    </div>
                </div>
                
                <div class="lv-item media">
                    <div class="lv-avatar pull-left">
                        <img src="img/profile-pics/1.jpg" alt="">
                    </div>
                    <div class="media-body">
                        <div class="ms-item">
                            Etiam ex arcumentum
                        </div>
                        <small class="ms-date"><i class="zmdi zmdi-time"></i> 20/02/2015 at 09:33</small>
                    </div>
                </div>
                
                <div class="lv-item media right">
                    <div class="lv-avatar pull-right">
                        <img src="img/profile-pics/8.jpg" alt="">
                    </div>
                    <div class="media-body">
                        <div class="ms-item">
                            Etiam nec facilisis lacus. Nulla imperdiet augue ullamcorper dui ullamcorper, eu laoreet sem consectetur. Aenean et ligula risus. Praesent sed posuere sem. Cum sociis natoque penatibus et magnis dis parturient montes,
                        </div>
                        <small class="ms-date"><i class="zmdi zmdi-time"></i> 20/02/2015 at 10:10</small>
                    </div>
                </div>
                
                <div class="lv-item media">
                    <div class="lv-avatar pull-left">
                        <img src="img/profile-pics/1.jpg" alt="">
                    </div>
                    <div class="media-body">
                        <div class="ms-item">
                            Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam ac tortor ut elit sodales varius. Mauris id ipsum id mauris malesuada tincidunt. Vestibulum elit massa, pulvinar at sapien sed, luctus vestibulum eros. Etiam finibus tristique ante, vitae rhoncus sapien volutpat eget
                        </div>
                        <small class="ms-date"><i class="zmdi zmdi-time"></i> 20/02/2015 at 10:24</small>
                    </div>
                </div>
            </div>
            
            <div class="lv-footer ms-reply">
                <form role="form" name="<?php echo $model['entity_post_name'];?>_chat_form" 
                    id="<?php echo $model['entity_post_name'];?>_chat_form" action="" 
                    method="POST" enctype="multipart/form-data" >
                    <textarea id="msg-input" placeholder="What's on your mind..."></textarea>
                    <button type="submit" id="send-msg-btn"><i class="zmdi zmdi-mail-send"></i></button>
                <form>
            </div>
        </div>
    </div>
</div>

    

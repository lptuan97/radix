<?php
if (!defined('_INCODE')) die('Access Deined...');
/*File này chứa chức năng đăng xuất*/

if (isLogin()){
    $token = getSession('loginToken');
    delete('login_token', "token='$token'");
    removeSession('loginToken');
    if (!empty($_SERVER['HTTP_REFERER'])){
        redirect($_SERVER['HTTP_REFERER'], true);
    }else{
        redirect('admin?module=auth&action=login');
    }

}

// $_SERVER['HTTP_REFERER'] 
//là một biến siêu toàn cục (superglobal) trong PHP, chứa địa chỉ trang web (URL) mà người dùng đến từ đó
// Ví dụ từ trang A -> nhấp vào liên kết sang trang B -> $_SERVER['HTTP_REFERER'] = [http://....linkA]
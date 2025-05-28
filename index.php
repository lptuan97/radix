<?php
session_start();
ob_start();
require_once 'routes.php';
require_once 'config.php';

//Import phpmailer lib
require_once 'includes/phpmailer/PHPMailer.php';
require_once 'includes/phpmailer/SMTP.php';
require_once 'includes/phpmailer/Exception.php';

require_once 'includes/functions.php';
require_once 'includes/permalink.php';
require_once 'includes/connect.php';
require_once 'includes/database.php';
require_once 'includes/session.php';

ini_set('display_errors', 0);
error_reporting(0);

$module = _MODULE_DEFAULT;
$action = _ACTION_DEFAULT;

set_exception_handler("setExceptionError");

set_error_handler('setErrorHandler');

loadExceptionError();


// print_r1($_SERVER);
//Xử lý rewrite url vidu: http://localhost/radix/bai-viet
$currentUrl = null;
// Lấy $_SERVER['PATH_INFO'] = /bai-viet
if (empty($_GET['module'])) {
    $currentUrl = !empty($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '/';
    //print_r1($currentUrl);  // -> /bai-viet
}

// Xóa ký tự /
if ($currentUrl != '/') {
    $currentUrl = trim($currentUrl, '/');
    //print_r1($currentUrl); // -> bai-viet
}

$targetUrl = null;
// Lặp mảng route được khai báo ở file router.php
if (!empty($route)) {
    foreach ($route as $key => $item) {
        if (preg_match('~^' . $key . '$~i', $currentUrl)) {
            $targetUrl = preg_replace('~^' . $key . '$~i', $item, $currentUrl); //Biểu thức chính quy
            //print_r1($targetUrl); //-> index.php?module=blog        
            break;
        }
    }
}

if (!empty($targetUrl)){
    $targetUrlArr = parse_url($targetUrl); //parse_url phân tích URL, trích xuất các thành phần thành mảng
    //print_r1($targetUrlArr);
        //     targetUrlArr
        //          (
        //              [path] => index.php
        //              [query] => module=blog
        //          )

    $targetUrlQuery = $targetUrlArr['query']; 
    // sử dụng explode() tách chuỗi
    // ví dụ url: http://localhost/radix/bai-viet/7
    $targetUrlQueryArr = explode('&', $targetUrlQuery);
    //print_r1($targetUrlQueryArr);
    //      [0] => module=blog
    //      [1] => action=detail
    //      [2] => id=7
    if(!empty($targetUrlQueryArr)){
        foreach ($targetUrlQueryArr as $item){
            $itemArr = array_filter(explode("=", $item));
            print_r1($itemArr);
            $_GET[$itemArr[0]] = $itemArr[1];
        }
    }
    
    
}
// die();
// print_r1($_GET);


if (!empty($_GET['module'])) {
    if (is_string($_GET['module'])) {
        $module = trim($_GET['module']);
    }
}

if (!empty($_GET['action'])) {
    if (is_string($_GET['action'])) {
        $action = trim($_GET['action']);
    }
}

$path = 'modules/' . $module . '/' . $action . '.php';

if (file_exists($path)) {
    require_once $path;
} else {
    require_once 'modules/errors/404.php';
}

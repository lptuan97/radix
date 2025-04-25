<?php
session_start();
require_once '../config.php';

echo "<div class ='container d-flex justify-content-center'>";
echo "all-$_session: '";
print_r($_SESSION);
echo '<br/>';
echo "all-$_get: '";
print_r($_GET);
echo '<br/>';
echo "all-$_post: ";
print_r($_POST);
echo '<br/>';
echo "</div>";


//Import phpmailer lib
require_once '../includes/phpmailer/PHPMailer.php';
require_once '../includes/phpmailer/SMTP.php';
require_once '../includes/phpmailer/Exception.php';

require_once '../includes/functions.php';
require_once '../includes/connect.php';
require_once '../includes/database.php';
require_once '../includes/session.php';

$module = _MODULE_DEFAULT_ADMIN;
$action = _ACTION_DEFAULT;

if (!empty($_GET['module'])){
    if (is_string($_GET['module'])){
        $module = trim($_GET['module']);
    }
}

if (!empty($_GET['action'])){
    if (is_string($_GET['action'])){
        $action = trim($_GET['action']);
    }
}

$path = 'modules/'.$module.'/'.$action.'.php';

if (file_exists($path)){
    require_once $path;
}else{
    require_once 'modules/errors/404.php';
}
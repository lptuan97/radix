<?php

$route['/'] = 'index.php?module=home';
$route['blog'] = 'index.php?module=blog';
//$route['bai-viet/(.+)'] = 'index.php?module=blog&action=detail&id=$1';
$route['blog/.+-(.+).html'] = 'index.php?module=blog&action=detail&id=$1';


$route['chuyen-muc/(.+)'] = 'index.php?module=blog&action=category&id=$1';
$route['con-cho'] = 'index.php?module=page';







// $route['/'] = 'index.php?module=home';

// $route['blog/.+-(.+).html'] = 'index.php?module=blog&action=detail&id=$1';

// $route['danh-muc/.+-(.+).html'] = 'index.php?module=blog&action=category&id=$1';

// $route['dich-vu/.+-(.+).html'] = 'index.php?module=services&action=detail&id=$1';

// $route['thong-tin/.+-(.+).html'] = 'index.php?module=page&action=detail&id=$1';

// $route['du-an/.+-(.+).html'] = 'index.php?module=portfolios&action=detail&id=$1';
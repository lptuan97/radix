<?php
if (!defined('_INCODE')) die('Access Deined...');

$data = [
    'pageTitle' => 'Danh sách trang'
];
layout('header', 'client');
// slide
require_once 'contents/slide.php';
// about
require_once 'contents/about.php';
// service
require_once 'contents/service.php';
// facts
require_once 'contents/facts.php';
// portfolio
require_once 'contents/portfolio.php';
// cta
require_once 'contents/cta.php';
// cta
require_once 'contents/blog.php';
// cta
require_once 'contents/partner.php';

// check
// require_once 'contents/check.php';




?>
<!----------------------------------- begin code ----------------------------------->





<!------------------------------------ end code ------------------------------------>

<?php
layout('footer', 'client');

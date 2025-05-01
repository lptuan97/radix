<?php

function getLinkService($slug){
    return 'dich-vu/'.$slug.'.html';
}

function getPrefixLinkService($module=''){
    if ($module=='services'){
        return 'dich-vu';
    }

    return false;
}
<?php
if (!defined('_INCODE')) die('Access Deined...');
//Lấy userId đăng nhập
$userId = isLogin()['user_id'];
$body = getBody();
if (!empty($body['id'])) {
    $serviceId = $body['id'];
    $serviceDetailRows = firstRaw("SELECT * FROM services WHERE id=$serviceId");
    print_r1($serviceDetailRows);
    if (!empty($serviceDetailRows)) {
        $duplicate = $serviceDetailRows['duplicate'];
        print_r1($duplicate, "success");
        $duplicate++;
        print_r1($duplicate, "danger");

        //Thực hiện nhân bản
        $dataInsert = [
            'name' => $serviceDetailRows['name']." (".$duplicate.")",
            'slug' =>  $serviceDetailRows['slug'],
            'icon' =>  $serviceDetailRows['icon'],
            'description' =>  $serviceDetailRows['description'],
            'content' =>  $serviceDetailRows['content'],
            'user_id' => $userId,
            'create_at' => date('Y-m-d H:i:s')
        ];
        print_r1($dataInsert, "warning");
        $updateDuplicateStatus = update(
            'services',
            [
                'duplicate' => $duplicate
            ],
            "id = $serviceId"
        );
        if ($updateDuplicateStatus) {
            $insertStatus = insert('services', $dataInsert);
            if ($insertStatus) {
                setFlashData('msg', 'Nhân bản thành công');
                setFlashData('msg_type', 'success');
            } else {
                setFlashData('msg', 'Nhân bản không thành công, do lỗi hệ thống, vui lòng thử lại sau');
                setFlashData('msg_type', 'danger');
                
            }
        }else{
            setFlashData('msg', 'Nhân bản không thành công, do lỗi hệ thống, vui lòng thử lại sau');
            setFlashData('msg_type', 'danger');
            // redirect("admin?module=services");
        }

    } else {
        setFlashData('msg', 'Dịch vụ không tồn tại hoặc đã bị xóa');
        setFlashData('msg_type', 'warning');
    }
}
redirect("admin?module=services");
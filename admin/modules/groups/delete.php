<?php
if (!defined('_INCODE')) die('Access Deined...');
$body = getBody();
if (!empty($body['id'])) {
    $groupId = $body['id'];
    // Truy vấn id group từ $body['id'];
    $groupDetailRows = getRows("SELECT id FROM `groups` WHERE id=$groupId");
    print_r($groupDetailRows);
    if ($groupDetailRows > 0) {
        //Kiểm tra xem trong nhóm còn người dùng không (Vì có liên kết khóa ngoại groupID Users)
        $userNum = getRows("SELECT id FROM users WHERE group_id=$groupId");
        if ($userNum > 0) {
            setFlashData('msg', 'Trong nhóm vẫn còn ' . $userNum . ' người dùng');
            setFlashData('msg_type', 'danger');
        } else {
            //Thực hiện xoá
            $condition = "id=$groupId";

            $deleteStatus = delete('groups', $condition);
            if (!empty($deleteStatus)) {
                setFlashData('msg', 'Xoá nhóm thành công');
                setFlashData('msg_type', 'success');
            } else {
                setFlashData('msg', 'Xoá nhóm không thành công. Vui lòng thử lại sau');
                setFlashData('msg_type', 'danger');
            }
        }
    } else {
        // Tìm không thấy trong db
        setFlashData('msg', 'Nhóm không tồn tại trên hệ thống');
        setFlashData('msg_type', 'danger');
    }
} else {
    setFlashData('msg', 'Liên kết không tồn tại');
    setFlashData('msg_type', 'danger');
}
redirect('admin?module=groups');

// Có một cách xóa dữ liệu bản có liên kết khóa ngoại
// -> Tạo ra một bản ghi mặc định, 
// -> Chuyển toàn bộ người dùng vào bảng ghi mặc định
// -> Bảng mặc định không thể xóa
<?php
if (!defined('_INCODE')) die('Access Deined...');
$data = [
    'pageTitle' => 'Đăng nhập hệ thống'
];

layout('header-login', 'admin', $data);

if(isPost()){
    $body = getBody(); //lây dữ liệu từ form
    $errors = [];

    // VALIDATE DỮ LIỆU
    // 1.Kiểm tra họ tên :
   


}




?>
<div class="row">
    <div class="col-6" style="margin: 20px auto;">

        <h3 class="text-center text-uppercase">Đăng ký tài khoản</h3>
        <?php
        // getMsg($msg, $msgType);
        ?>
        <form action="" method="post">
            <div class="form-group">
                <label for="">Họ tên</label>
                <input type="text" name="fullname" class="form-control" placeholder="Họ tên..." value="<?php //echo old('fullname', $old); 
                                                                                                        ?>">
                <?php //echo form_error('fullname', $errors, '<span class="error">', '</span>'); 
                ?>
            </div>

            <div class="form-group">
                <label for="">Điện thoại</label>
                <input type="text" name="phone" class="form-control" placeholder="Điện thoại..." value="<?php //echo old('phone', $old); 
                                                                                                        ?>">
                <?php //echo form_error('phone', $errors, '<span class="error">', '</span>'); 
                ?>
            </div>

            <div class="form-group">
                <label for="">Email</label>
                <input type="text" name="email" class="form-control" placeholder="Địa chỉ email..." value="<?php //echo old('email', $old); 
                                                                                                            ?>">
                <?php //echo form_error('email', $errors, '<span class="error">', '</span>'); 
                ?>
            </div>

            <div class="form-group">
                <label for="">Mật khẩu</label>
                <input type="password" name="password" class="form-control" placeholder="Mật khẩu...">
                <?php //echo form_error('password', $errors, '<span class="error">', '</span>'); 
                ?>
            </div>

            <div class="form-group">
                <label for="">Nhập lại mật khẩu</label>
                <input type="password" name="confirm_password" class="form-control" placeholder="Nhập lại mật khẩu...">
                <?php //echo form_error('confirm_password', $errors, '<span class="error">', '</span>'); 
                ?>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
            <hr>
            <p class="text-center"><a href="?module=auth&action=login">Đăng nhập hệ thống</a></p>
        </form>
    </div>
</div>
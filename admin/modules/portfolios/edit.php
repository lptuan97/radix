<?php
if (!defined('_INCODE')) die('Access Deined...');
$data = [
    'pageTitle' => 'Cập nhật dự án'
];

layout('header', 'admin', $data);
layout('sidebar', 'admin', $data);
layout('breadcrumb', 'admin', $data);

//Lấy dữ liệu cũ của dự án
$body = getBody('get'); //Yêu cầu lấy phương thức get

if (!empty($body['id'])){
    $portfolioId = $body['id'];

    $portfolioDetail = firstRaw("SELECT * FROM portfolios WHERE id=$portfolioId");

    if (empty($portfolioDetail)){
        //Không Tồn tại
        redirect('admin?module=portfolios');
    }

}else{
    redirect('admin?module=portfolios');
}

//Xử lý thêm nhóm người dùng
if (isPost()){

    //Validate form
    $body = getBody(); //Lấy tất cả dữ liệu trong form

    $errors = []; //Mảng lưu trữ các lỗi

    //Validate tên dự án: Bắt buộc nhập

    if (empty(trim($body['name']))){
        $errors['name']['required'] = 'Tên dự án bắt buộc phải nhập';
    }

    //Validate slug: Bắt buộc nhập
    if (empty(trim($body['slug']))){
        $errors['slug']['required'] = 'Đường dẫn tĩnh bắt buộc phải nhập';
    }

    //Validate nội dung: Bắt buộc phải nhập
    if (empty(trim($body['content']))){
        $errors['content']['required'] = 'Nội dung bắt buộc phải nhập';
    }

    //Validate video: Bắt buộc phải nhập
    if (empty(trim($body['video']))){
        $errors['video']['required'] = 'Link video bắt buộc phải nhập';
    }

    //Validate danh mục: Bắt buộc chọn
    if (empty(trim($body['portfolio_category_id']))){
        $errors['portfolio_category_id']['required'] = 'Danh mục bắt buộc phải chọn';
    }

    //Validate ảnh đại diện: Bắt buộc nhập
    if (empty(trim($body['thumbnail']))){
        $errors['thumbnail']['required'] = 'Ảnh đại diện bắt buộc phải chọn';
    }

    //Kiểm tra mảng $errors
    if (empty($errors)) {
        //Không có lỗi xảy ra

        $dataUpdate = [
            'name' => trim($body['name']),
            'slug' => trim($body['slug']),
            'content' => trim($body['content']),
            'description' => trim($body['description']),
            'video' => trim($body['video']),
            'portfolio_category_id' => trim($body['portfolio_category_id']),
            'thumbnail' => trim($body['thumbnail']),
            'update_at' => date('Y-m-d H:i:s')
        ];

        $condition = "id=$portfolioId";

        $updateStatus = update('portfolios', $dataUpdate, $condition);

        if ($updateStatus){
            setFlashData('msg', 'Cập nhật dự án thành công');
            setFlashData('msg_type', 'success');

        }else{
            setFlashData('msg', 'Hệ thống đang gặp sự cố! Vui lòng thử lại sau.');
            setFlashData('msg_type', 'danger');

        }

    }else{

        //Có lỗi xảy ra
        setFlashData('msg', 'Vui lòng kiểm tra dữ liệu nhập vào');
        setFlashData('msg_type', 'danger');
        setFlashData('errors', $errors);
        setFlashData('old', $body);
    }

    //Load lại trang sửa hiện tại
    redirect('admin?module=portfolios&action=edit&id='.$portfolioId);
}

$msg = getFlashData('msg');
$msgType = getFlashData('msg_type');
$errors = getFlashData('errors');
$old = getFlashData('old');

if (empty($old) && !empty($portfolioDetail)){
    $old = $portfolioDetail;
}

//Truy vấn lấy danh sách danh mục
$allCate = getRaw("SELECT * FROM portfolio_categories ORDER BY name");
?>
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <form action="" method="post">
                <?php
                getMsg($msg, $msgType);
                ?>
                <div class="form-group">
                    <label for="">Tên dự án</label>
                    <input type="text" class="form-control slug" name="name" placeholder="Tên dự án..." value="<?php echo old('name', $old); ?>"/>
                    <?php echo form_error('name', $errors, '<span class="error">', '</span>'); ?>
                </div>

                <div class="form-group">
                    <label for="">Đường dẫn tĩnh</label>
                    <input type="text" class="form-control render-slug" name="slug" placeholder="Đường dẫn tĩnh..." value="<?php echo old('slug', $old); ?>"/>
                    <?php echo form_error('slug', $errors, '<span class="error">', '</span>'); ?>
                    <p class="render-link"><b>Link</b>: <span></span></p>
                </div>

                <div class="form-group">
                    <label for="">Mô tả</label>
                    <textarea name="description" class="form-control" placeholder="Mô tả..."><?php  echo old('description', $old); ?></textarea>
                </div>

                <div class="form-group">
                    <label for="">Nội dung</label>
                    <textarea name="content" class="form-control editor"><?php echo old('content', $old) ?></textarea>
                    <?php echo form_error('content', $errors, '<span class="error">', '</span>'); ?>
                </div>

                <div class="form-group">
                    <label for="">Link video</label>
                    <input type="url" class="form-control" name="video" placeholder="Link video youtube..." value="<?php echo old('video', $old); ?>"/>
                    <?php echo form_error('video', $errors, '<span class="error">', '</span>'); ?>
                </div>

                <div class="form-group">
                    <label for="">Danh mục</label>
                    <select name="portfolio_category_id" class="form-control">
                        <option value="0">Chọn danh mục</option>
                        <?php
                        if (!empty($allCate)){
                            foreach ($allCate as $item){
                                ?>
                                <option value="<?php echo $item['id']; ?>" <?php echo (old('portfolio_category_id', $old)==$item['id'])?'selected':false; ?>><?php echo $item['name']; ?></option>
                                <?php
                            }
                        }
                        ?>
                    </select>
                    <?php echo form_error('portfolio_category_id', $errors, '<span class="error">', '</span>'); ?>
                </div>

                <div class="form-group">
                    <label for="">Ảnh đại diện</label>
                    <div class="row ckfinder-group">
                        <div class="col-10">
                            <input type="text" class="form-control image-render" name="thumbnail" placeholder="Đường dẫn ảnh..." value="<?php echo old('thumbnail', $old); ?>"/>
                        </div>
                        <div class="col-2">
                            <button type="button" class="btn btn-success btn-block choose-image">Chọn ảnh</button>
                        </div>
                    </div>

                    <?php echo form_error('thumbnail', $errors, '<span class="error">', '</span>'); ?>
                </div>


                <button type="submit" class="btn btn-primary">Cập nhật</button>
                <a href="<?php echo getLinkAdmin('pages', 'lists'); ?>" class="btn btn-success">Quay lại</a>
            </form>
        </div>
    </section>

<?php
layout('footer', 'admin', $data);

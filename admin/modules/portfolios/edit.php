<?php

// use Symfony\Component\VarDumper\Cloner\Data;

if (!defined('_INCODE')) die('Access Deined...');
$data = [
    'pageTitle' => 'Cập nhật dự án'
];

layout('header', 'admin', $data);
layout('sidebar', 'admin', $data);
layout('breadcrumb', 'admin', $data);

//Lấy dữ liệu cũ của dự án
$body = getBody('get'); //Yêu cầu lấy phương thức get

if (!empty($body['id'])) {
    $portfolioId = $body['id'];
    // Truy vấn portfolio
    $portfolioDetail = firstRaw("SELECT * FROM portfolios WHERE id=$portfolioId");
    $portfolioImage = getRaw("SELECT * FROM portfolio_images WHERE portfolio_id = $portfolioId");
    if(empty($portfolioImage)){
        print_r1("cái rỗng nè bà con ơi FALSE");
    }else{
        print_r1("TRUE");
    }

    if (empty($portfolioDetail)) {
        //Không Tồn tại
        redirect('admin?module=portfolios');
    }
} else {
    redirect('admin?module=portfolios');
}

// chuyển kết quả truy vấn image giống với biết post (body());
$arrayConvertPost = [];
if (!empty($portfolioImage)) {
    foreach ($portfolioImage as $key => $value) {
        // echo "portfolioImage[$key]";
        // print_r1($portfolioImage[$key]);
        $arrayConvertPost['galleryId'][$key] = $portfolioImage[$key]['id'];
        $arrayConvertPost['gallery'][$key] = $portfolioImage[$key]['image'];
    }
}

//Xử lý thêm nhóm người dùng
if (isPost()) {

    //Validate form
    $body = getBody(); //Lấy tất cả dữ liệu trong form

    $errors = []; //Mảng lưu trữ các lỗi

    //Validate tên dự án: Bắt buộc nhập

    if (empty(trim($body['name']))) {
        $errors['name']['required'] = 'Tên dự án bắt buộc phải nhập';
    }

    //Validate slug: Bắt buộc nhập
    if (empty(trim($body['slug']))) {
        $errors['slug']['required'] = 'Đường dẫn tĩnh bắt buộc phải nhập';
    }

    //Validate nội dung: Bắt buộc phải nhập
    if (empty(trim($body['content']))) {
        $errors['content']['required'] = 'Nội dung bắt buộc phải nhập';
    }

    //Validate video: Bắt buộc phải nhập
    if (empty(trim($body['video']))) {
        $errors['video']['required'] = 'Link video bắt buộc phải nhập';
    }

    //Validate danh mục: Bắt buộc chọn
    if (empty(trim($body['portfolio_category_id']))) {
        $errors['portfolio_category_id']['required'] = 'Danh mục bắt buộc phải chọn';
    }

    //Validate ảnh đại diện: Bắt buộc nhập
    if (empty(trim($body['thumbnail']))) {
        $errors['thumbnail']['required'] = 'Ảnh đại diện bắt buộc phải chọn';
    }

    // Validate ảnh dự án
    print_r1($body);
    if(!empty($body['gallery'])){
        $galleryArr = $body['gallery'];
        foreach ($galleryArr as $key => $value) {
            if (empty(trim($value))) {
                $errors['gallery']['required'][$key] = 'ảnh không được trống';
            }
        }
    }
    
    // }else{
    //     $body['gallery']="";
    // }
    

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
        // $updateStatus = true;
        if ($updateStatus) {
            // print_r1($body);
            $bodyPorflioImage = [];
            // global $arrayConvertPost;
            $bodyPorflioImage['galleryId'] = !empty($body['galleryId'])?$body['galleryId']:[];
            $bodyPorflioImage['gallery'] = !empty($body['gallery'])?$body['gallery']:[];
            $dataUpdate = updateImage($bodyPorflioImage);
            echo "xxxx";
            print_r1($dataUpdate);
            if (!empty($dataUpdate) && $dataUpdate != false) {
                // print_r1($bodyPorflioImage);

                // insert
                if (!empty($dataUpdate['insert'])) {
                    print_r1($dataUpdate['insert']);
                    print_r1($portfolioId);
                    foreach ($dataUpdate['insert'] as $value) {
                        $dataInsert = [
                            'portfolio_id' => $portfolioId,
                            'image' => $value['image'],
                            'create_at' => date('Y-m-d H:i:s'),
                        ];
                        insert('portfolio_images', $dataInsert);
                    }
                }
                // update 
                if (!empty($dataUpdate['update'])) {
                    print_r1(($dataUpdate['update']));
                    foreach ($dataUpdate['update'] as $value) {
                        $dataInsert = [
                            'image' => $value['image'],
                            'update_at' => date('Y-m-d H:i:s'),
                        ];
                        $idImage = $value['id'];
                        $condition = "id=$idImage";
                        update('portfolio_images', $dataInsert, $condition);
                    }
                }
                //delete 
                if (!empty($dataUpdate['delete'])) {
                    print_r1(($dataUpdate['delete']));
                    foreach ($dataUpdate['delete'] as $value) {
                        $dataInsert = [
                            'image' => $value['image'],
                            'update_at' => date('Y-m-d H:i:s'),
                        ];
                        $idImage = $value['id'];
                        $condition = "id=$idImage";
                        delete('portfolio_images', $condition);
                    }
                }
            } else {
                // Không cập nhật image
            }

            setFlashData('msg', 'Cập nhật dự án thành công');
            setFlashData('msg_type', 'success');
        } else {
            setFlashData('msg', 'Hệ thống đang gặp sự cố! Vui lòng thử lại sau.');
            setFlashData('msg_type', 'danger');
        }
    } else {
        //Có lỗi xảy ra
        setFlashData('msg', 'Vui lòng kiểm tra dữ liệu nhập vào');
        setFlashData('msg_type', 'danger');
        setFlashData('errors', $errors);
        setFlashData('old', $body);
    }

    //Load lại trang sửa hiện tại
    redirect('admin?module=portfolios&action=edit&id=' . $portfolioId);
}




/*
    [gallery] => Array
        (
            [0] => Array
                (
                    [id] => 5
                    [portfolio_id] => 14
                    [image] => /radix/uploads/images/adcf41da-5669-4544-b19f-da11625bfb2e.jpg
                    [create_at] => 
                    [update_at] => 
                )

            [1] => Array
                (
                    [id] => 6
                    [portfolio_id] => 14
                    [image] => /radix/uploads/images/zpers.jpg
                    [create_at] => 
                    [update_at] => 
                )

        )

    chuyển sang 

    [galleryId] => Array
        (
            [0] => 5 (id - )
            [1] => 6
        )

    [gallery] => Array
        (
            [0] => /radix/uploads/images/adcf41da-5669-4544-b19f-da11625bfb2e.jpg ([image])
            [1] => /radix/uploads/images/zpers.jpg
        )
*/



$msg = getFlashData('msg');
$msgType = getFlashData('msg_type');
$errors = getFlashData('errors');
$old = getFlashData('old');


if (empty($old) && !empty($portfolioDetail)) {
    $old = $portfolioDetail;

    $old['galleryId'] = !empty($arrayConvertPost['galleryId']) ? $arrayConvertPost['galleryId'] : ""; // Hiển tự db
    $old['gallery'] = !empty($arrayConvertPost['gallery']) ? $arrayConvertPost['gallery'] : "";
    // echo "Lúc này chưa có old / dữ liệu này lấy từ db";
    // print_r1($old);
} else {
    // echo "lúc này có old/ dữ liệu này tạm sesssion";
    // print_r1($old);
}

//Truy vấn lấy danh sách danh mục
$allCate = getRaw("SELECT * FROM portfolio_categories ORDER BY name");



// Hàm cập nhật portfloiosImage
function updateImage($bodyPorflioImage)
{
    global $portfolioImage;
    print_r1($portfolioImage);
    global $portfolioId;
    global $arrayConvertPost;
    // print_r1($arrayConvertPost['galleryId']);
    // print_r1($bodyPorflioImage);
    $dataResult = [];
    
    // TRường hợp 1: dữ liệu DB khác rỗng 
    if (!empty($portfolioImage)) {
        $lengArrayConvertPost = count($arrayConvertPost['galleryId']);
        // Post khác rỗng => Inser/update/delete/noupdate
        if (!empty($bodyPorflioImage)) {
            $lengBodyPorflioImage = count($bodyPorflioImage['galleryId']);
            for ($i = 0; $i < $lengBodyPorflioImage; $i++) {
                // Nếu id khác rỗng -> UPDATE || NOUPDATE
                if ($bodyPorflioImage['galleryId'][$i] != '') {

                    for ($j = 0; $j < $lengArrayConvertPost; $j++) {
                        // Nếu id = id -> image != image -> update, ngược lại noupdate
                        if ($arrayConvertPost['galleryId'][$j] == $bodyPorflioImage['galleryId'][$i]) {
                            // UPDATE
                            if ($arrayConvertPost['gallery'][$j] != $bodyPorflioImage['gallery'][$i]) {
                                $dataResult['update'][] = [
                                    'id' => $bodyPorflioImage['galleryId'][$i],
                                    'image' => $bodyPorflioImage['gallery'][$i]
                                ];
                            }
                            // NOUPDATE
                            else {
                                $dataResult['notupdate'][] = [
                                    'id' => $bodyPorflioImage['galleryId'][$i],
                                    'image' => $bodyPorflioImage['gallery'][$i]
                                ];
                            }
                        } else {
                        }
                    }
                }
                // Ngược lại: INSERT nếu id của post rỗng 
                else {
                    $dataResult['insert'][] = [
                        'id' => $bodyPorflioImage['galleryId'][$i],
                        'image' => $bodyPorflioImage['gallery'][$i]
                    ];
                }
            }
            //DELETE
            // Lặp dữ liệu mảng db
            for ($i = 0; $i < $lengArrayConvertPost; $i++) {
                // Nêu value db $arrayConvertPost['galleryId'][$i] không tồn tại trong mảng $bodyPorflioImage['galleryId']
                // -> đưa vào dataResult['delete']
                if (in_array($arrayConvertPost['galleryId'][$i], $bodyPorflioImage['galleryId']) == false) {
                    $dataResult['delete'][] = [
                        'id' => $arrayConvertPost['galleryId'][$i],
                        'image' => $arrayConvertPost['gallery'][$i]
                    ];
                }
            }
            return $dataResult;
        }
        // Ngược lại Post rỗng -> Xóa hết dữ liệu db
        else {
            for ($i = 0; $i < $lengArrayConvertPost; $i++) {
                $dataResult['delete'][] = [
                    'id' => $arrayConvertPost['galleryId'][$i],
                    'image' => $arrayConvertPost['gallery'][$i]
                ];
            }
            return $dataResult;
        }
    }
    // Ngược lại dữ liệu DB rỗng
    else {
        // Nếu Post khác rỗng -> insert toàn bộ post
        if (!empty($bodyPorflioImage)) {
            $lengBodyPorflioImage = count($bodyPorflioImage['galleryId']);
            for ($i = 0; $i < $lengBodyPorflioImage; $i++) {
                $dataResult['insert'][] = [
                    'id' => $bodyPorflioImage['galleryId'][$i],
                    'image' => $bodyPorflioImage['gallery'][$i]
                ];
            }
        }; //Trường hợp cả 2 điều rỗng không cập nhật
        return $dataResult;
    }
    return $dataResult;
}


// else{
//     if(!empty($bodyPorflioImage['galleryId'])){
//         for ($i = 0; $i < $bodyPorflioImage; $i++){
//             $dataResult['insert'][] = [
//                 'id' => $bodyPorflioImage['galleryId'][$i],
//                 'image' => $bodyPorflioImage['gallery'][$i]
//             ];
//         }
//     }
// }

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
                <input type="text" class="form-control slug" name="name" placeholder="Tên dự án..." value="<?php echo old('name', $old); ?>" />
                <?php echo form_error('name', $errors, '<span class="error">', '</span>'); ?>
            </div>

            <div class="form-group">
                <label for="">Đường dẫn tĩnh</label>
                <input type="text" class="form-control render-slug" name="slug" placeholder="Đường dẫn tĩnh..." value="<?php echo old('slug', $old); ?>" />
                <?php echo form_error('slug', $errors, '<span class="error">', '</span>'); ?>
                <p class="render-link"><b>Link</b>: <span></span></p>
            </div>

            <div class="form-group">
                <label for="">Mô tả</label>
                <textarea name="description" class="form-control" placeholder="Mô tả..."><?php echo old('description', $old); ?></textarea>
            </div>

            <div class="form-group">
                <label for="">Nội dung</label>
                <textarea name="content" class="form-control editor"><?php echo old('content', $old) ?></textarea>
                <?php echo form_error('content', $errors, '<span class="error">', '</span>'); ?>
            </div>

            <div class="form-group">
                <label for="">Link video</label>
                <input type="url" class="form-control" name="video" placeholder="Link video youtube..." value="<?php echo old('video', $old); ?>" />
                <?php echo form_error('video', $errors, '<span class="error">', '</span>'); ?>
            </div>

            <div class="form-group">
                <label for="">Danh mục</label>
                <select name="portfolio_category_id" class="form-control">
                    <option value="0">Chọn danh mục</option>
                    <?php
                    if (!empty($allCate)) {
                        foreach ($allCate as $item) {
                    ?>
                            <option value="<?php echo $item['id']; ?>" <?php echo (old('portfolio_category_id', $old) == $item['id']) ? 'selected' : false; ?>><?php echo $item['name']; ?></option>
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
                        <input type="text" class="form-control image-render" name="thumbnail" placeholder="Đường dẫn ảnh..." value="<?php echo old('thumbnail', $old); ?>" />
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-success btn-block choose-image">Chọn ảnh</button>
                    </div>
                </div>

                <?php echo form_error('thumbnail', $errors, '<span class="error">', '</span>'); ?>
            </div>

            <div class="form-group">
                <label for="">Ảnh dự án</label>

                <div class="gallery-images">
                    <?php
                    // print_r1($old['gallery']);
                    // $oldGallery = $old['gallery'];
                    // echo "oldGallery";
                    // print_r1($oldGallery);

                    // print_r1($oldGallery[$old['galleryId']]);
                    // echo "old";
                    // print_r1($old);

                    function galleryImages($valueId, $valueImage, $errorsImage)
                    {
                        $strHTML = '<div class="gallery-item">
                                        <div class="row">
                                            <div class="col-11">
                                                <div class="row ckfinder-group">
                                                    <div class="col-10">
                                                        <input type="text" name="galleryId[]" value = "' . $valueId . '" hidden>
                                                        <input type="text" class="form-control image-render" name="gallery[]" placeholder="Đường dẫn ảnh..." value="' . $valueImage . '">
                                                        <span class="error">' . $errorsImage . ' </span>
                                                    </div>
                                                    <div class="col-2">
                                                        <button type="button" class="btn btn-success btn-block choose-image ckfinder-popup-portfolios">Chọn ảnh</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-1">
                                                <a href="#" class="remove btn btn-danger btn-block"><i class="fa fa-times"></i> </a>
                                            </div>
                                        </div>
                                        </div>';
                        echo $strHTML;
                    }
                    // $old['galleryId']
                    // $old['gallery']
                    if (!empty($old['galleryId'])) {
                        foreach ($old['galleryId'] as $key => $value) {
                            $valueId = !empty($old['galleryId'][$key]) ? $old['galleryId'][$key] : "";
                            $valueImage = !empty($old['gallery'][$key]) ? $old['gallery'][$key] : "";
                            $errorsImage = !empty($errors['gallery']['required'][$key]) ? $errors['gallery']['required'][$key] : "";
                            galleryImages($valueId, $valueImage, $errorsImage);
                        }
                    }

                    ?>

                </div>

                <p style="margin-top: 10px;">
                    <a href="" id="add-gallery-item" class="btn btn-warning btn-sm add-gallery">Thêm ảnh</a>
                </p>

            </div>

            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <a href="<?php echo getLinkAdmin('pages', 'lists'); ?>" class="btn btn-success">Quay lại</a>
        </form>
    </div>
</section>

<?php
layout('footer', 'admin', $data);

<?php
if (!defined('_INCODE')) die('Access Deined...');
$data = [
    'pageTitle' => 'Quản lý Services'
];
layout('header', 'admin', $data);
layout('sidebar', 'admin', $data);
layout('breadcrumb', 'admin', $data);

// Xử lý dữ liệu lọc
$filter = '';
if (isGet()) {
    $body = getBody();
    if (!empty($body['keyword'])) {
        $keyword = $body['keyword'];
        $filter .= "WHERE name LIKE '%$keyword%'";
    }
}
// Xử lý phân trang
// 1. Lấy số lượng bản ghi
$allUserNum = getRows("SELECT id FROM services $filter");
// 2. Xác định số lượng bản ghi trên 1 trang
$perPage = _PER_PAGE; //Mỗi trang có 10 bản ghi
// 3. Tính số trang
$maxPage = ceil($allUserNum / $perPage); //ceil() làm tròn lên
// 4. Xử lý số trang dựa vào phương thức GET
if (!empty(getBody()['page'])) {
    $page = getBody()['page'];
    if ($page < 1 || $page > $maxPage) {
        $page = 1;
    }
} else {
    $page = 1;
}
// 5. Tính toán offset trong Limit dựa vào biến $page
/* 3 là số phần tử hiển thị trong 1 trang

    ...LIMIT 10 OFFSET 5;
    LIMIT 10 giới hạn đầu ra ở 10 hàng.
    OFFSET 5 bỏ qua 5 hàng đầu tiên và bắt đầu hiển thị từ hàng thứ 6.
    
 * $page = 1 => offset = 0 = ($page-1)*$perPage = (1-1)*3 = 0 -> 0 là offset
 * $page = 2 => offset = 3 = ($page-1)*$perPage = (2-1)*3 = 3
 * $page = 3 => offset = 6 = ($page-1)*$perPage = (3-1)*3 = 6
 *  -> trang 1: SELECT * FROM services LIMIT 3 OFFSET $offset 0;
 *  -> trang 2: SELECT * FROM services LIMIT 3 OFFSET $offset 3;
 *  -> trang 3: SELECT * FROM services LIMIT 3 OFFSET $offset 6;
 *  Viết tắt: SELECT * FROM services LIMINT 6, 3;
 * 
 * 
 * */


$offset = ($page - 1) * $perPage;


//Xử lý query string tìm kiếm với phân trang
$queryString = null;
if (!empty($_SERVER['QUERY_STRING'])) {
    $queryString = $_SERVER['QUERY_STRING'];
    $queryString = str_replace('module=services', '', $queryString);
    $queryString = str_replace('&page=' . $page, '', $queryString);
    $queryString = trim($queryString, '&');
    $queryString = '&' . $queryString;
}

// Truy vấn lấy tất cả bản ghi 
$listAllService = getRaw("SELECT services.id, services.icon, services.name, services.create_at, users.fullname, services.user_id FROM services 
LEFT JOIN users 
ON users.id = services.user_id $filter
ORDER BY services.create_at
DESC LIMIT $offset, $perPage");
$msg = getFlashData('msg');
$msgType = getFlashData('msg_type');

print_r1($listAllService);
?>

<section class="content">
    <div class="container-fluid">
        <!-- Thêm dịch vụ -->
        <a href="<?php echo getLinkAdmin('services', 'add'); ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Thêm dịch vụ</a>
        <hr>
        <!-- Tìm kiếm -->
        <form action="" method="get">
            <div class="row">

                <div class="col-10">
                    <input type="search" class="form-control" name="keyword" placeholder="Từ khoá tìm kiếm..." value="<?php echo (!empty($keyword) ? $keyword : false); ?>">
                </div>
                <div class="col-2">
                    <button type="submit" class="btn btn-primary btn-block">Tìm kiếm</button>
                </div>
            </div>
            <input type="hidden" name="module" value="services">
        </form>

        <?php
        //Hiển thị thông báo
        getMsg($msg, $msgType);
        ?>

        <table class="table table-bordered">
            <thead>
                <tr class="text-center">
                    <th width="5%">STT</th>
                    <th>Ảnh</th>
                    <th>Tên</th>
                    <th>Đăng bởi</th>
                    <th>Thời gian</th>
                    <th width="20%">Xem</th>
                    <th width="10%">Sửa</th>
                    <th width="10%">Xoá</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($listAllService)):
                    $count = 0;
                    foreach ($listAllService as $key => $item):

                ?>
                        <tr>
                            <td><?php echo $key+1; ?></td>
                            <td><?php echo (isFontIcon($item['icon'])) ? $item['icon'] : '<img src="' . $item['icon'] . '" width="80"/>'; ?></td>
                            <td><a href="<?php echo getLinkAdmin('services', 'edit', ['id'=>$item['id']]); ?>"><?php echo $item['name']; ?></a></td>
                            <td>
                                <a href="<?php echo getLinkQueryString('user_id', $item['user_id']); ?>">
                                    <?php echo $item['fullname']; ?>
                                </a>
                            </td>
                            <td><?php echo $item['create_at']; ?></td>
                            <td class="">
                                <a href="<?php echo getLinkAdmin('services', 'detail', ['id' => $item['id']]); ?>" class="btn btn-primary btn-sm"><i class="fa fa-eye"></i> Xem</a>
                                <a href="<?php echo getLinkAdmin('services', 'duplicate', ['id' => $item['id']]); ?>" class="btn btn-info btn-sm"><i class="fa fa-copy"></i> Nhân bản</a>
                        </td>
                            <td><a href="<?php echo getLinkAdmin('services', 'edit', ['id' => $item['id']]); ?>" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i> Sửa</a></td>
                            <td><a href="<?php echo getLinkAdmin('services', 'delete', ['id' => $item['id']]); ?>" onclick="return confirm('Are you sure?')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Xoá</a></td>

                        </tr>
                    <?php endforeach;
                else: ?>
                    <tr>
                        <td colspan="8">
                            <div class="alert alert-danger text-center">Không có dữ liệu</div>
                        </td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
        <nav aria-label="Page navigation example" class="d-flex justify-content-end">
            <ul class="pagination pagination-sm">
                <?php
                if ($page > 1) {
                    $prevPage = $page - 1;
                    echo '<li class="page-item"><a class="page-link" href="' . _WEB_HOST_ROOT . '?module=users' . $queryString . '&page=' . $prevPage . '">Trước</a></li>';
                }
                ?>
                <?php
                $begin = $page - 2;
                if ($begin < 1) {
                    $begin = 1;
                }
                $end = $page + 2;
                if ($end > $maxPage) {
                    $end = $maxPage;
                }
                for ($index = $begin; $index <= $end; $index++) { ?>
                    <li class="page-item <?php echo ($index == $page) ? 'active' : false; ?>"><a class="page-link" href="<?php echo _WEB_HOST_ROOT . '?module=users' . $queryString . '&page=' . $index; ?>"><?php echo $index; ?></a></li>
                <?php } ?>
                <?php
                if ($page < $maxPage) {
                    $nextPage = $page + 1;
                    echo '<li class="page-item"><a class="page-link" href="' . _WEB_HOST_ROOT . '?module=users' . $queryString . '&page=' . $nextPage . '">Sau</a></li>';
                }
                ?>

            </ul>
        </nav>

    </div>

</section>

<?php
layout('footer', 'admin', $data);

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="indexDetail.js"></script>

</head>

<body>
    <!-- Header -->
    <?php
    require_once 'header.php';
    ?>

    <!-- Video trailer banner -->
    <div class="banner-trailer">

    </div>

    <!-- Detail Films -->
    <div class="detail-film-container ps-5">
        <div class="row">
            <div class="col-md-4 col-11 col-sm-6 col-lg-4 col-xl-3">
                <img src="./image/poster4fixed.jpg" alt="..." class="img-thumbnail">
            </div>
            <div class="col-md-8 mt-5">
                <h1>Tên phim</h1>
                <p>Thể loại: Hành động</p>
                <p>Đạo diễn: Nguyễn Văn A</p>
                <p>Diễn viên: Nguyễn Văn A, Nguyễn Văn B, Nguyễn Văn C</p>
                <p>Thời lượng: 120 phút</p>
                <p>Ngày công chiếu: 01/01/2022</p>
                <p>Mô tả: Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
            </div>
        </div>
    </div>

    <!-- Content film -->
    <div class="content-film-container m-5">
        <h3 class="border-start border-primary border-5 ps-2">Nội dung</h3>
        <p>Ông Vũ Ngọc Sơn - Giám đốc công nghệ của NCS nhận định sau các vụ việc gần đây, có thể thấy hình thức tấn công của tin tặc tương đối giống nhau: tấn công nằm vùng một thời gian rồi thực hiện mã hóa dữ liệu. Tuy nhiên, ông cho rằng kỹ thuật tấn công của các vụ không giống nhau, từ đó đặt ra khả năng đây là các chiến dịch của những nhóm tội phạm khác nhau.
            "Chưa có bằng chứng cho thấy đây là một chiến dịch có tổ chức. Tuy nhiên cũng không loại trừ khả năng này vì các vụ việc liên tiếp xảy ra trong một thời gian khá ngắn", lãnh đạo NCS nói thêm.
            Trao đổi với Thanh Niên, chuyên gia bảo mật cho biết để thực hiện mã hóa dữ liệu, tin tặc phải có đủ thời gian để biết thông tin nào quan trọng. Vì vậy, chúng sẽ phải cài các mã độc nằm vùng, thu thập thông tin hằng ngày, từ đó phân tích, đánh giá và lựa chọn mục tiêu để mã hóa. Với tổ chức có càng nhiều thành phần và càng phức tạp thì thời gian nằm vùng phải càng lâu.</p>
    </div>

    <!-- Lịch chiếu -->
    <div class="showtimes-container ms-5">
        <h3 class="border-start border-primary border-5 ps-2">Lịch chiếu</h3>
    </div>

    <!-- Phân chia ngày chiếu và lọc phim theo rạp -->
    <div class="showtimes-filter-container d-flex flex-row">
        <div class="slider-showtimes">
            <button id="prev-slide" class="slide-button material-symbols-rounded">&lt;</button>
            <div class="list-date">
                <input type="button" value="Hôm nay 03/04" class="item-btn-date">
                <input type="button" value="Thứ năm 04/04" class="item-btn-date">
                <input type="button" value="Thứ sáu 05/04" class="item-btn-date">
                <input type="button" value="Thứ bảy 06/04" class="item-btn-date">
                <input type="button" value="Chủ nhật 07/04" class="item-btn-date">
                <input type="button" value="Thứ hai 08/04" class="item-btn-date">
                <input type="button" value="Thứ ba 09/04" class="item-btn-date">
            </div>
            <button id="next-slide" class="slide-button material-symbols-rounded">&gt;</button>
        </div>
        <div class="showtimes-filter-theater p-2 d-flex flex-row">
            <!-- Location dropdown -->
            <select id="location" name="location" class="form-select">
                <option value="" selected>Toàn quốc</option>
                <option value="">Tây Ninh</option>
                <option value="">TP Hồ Chí Minh</option>
                <option value="">Hà Nội</option>
                <option value="">Huế</option>
                <!-- Add more location options here -->
            </select>
            <!-- Theater dropdown -->
            <select id="theater" name="theater" class="form-select ms-2">
                <option value="" selected>Tất cả rạp</option>
                <option value="">Microsoft Hoà Thành</option>
                <option value="">Microsoft Quận 11</option>
                <option value="">Microsoft Long Biên</option>
                <option value="">Microsoft Phú Lộc</option>
                <!-- Add more theater options here -->
            </select>
        </div>
    </div>

    <!-- Footer -->
    <?php
    require_once 'footer.php';
    ?>

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>

</html>
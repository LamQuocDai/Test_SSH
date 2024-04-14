<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="style.css">
    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <!-- Header -->
    <?php
    require_once 'header.php';
    ?>

    <!-- carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./image/poster1fixed.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./image/poster2fixed.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="./image/poster3fixed.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- navbar -->
    <i class='far fa-grin-hearts' style='font-size:24px'></i>
    <div class="navbar">
        <nav class="navbar navbar-expand-lg navbar-light bg-white">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <a class="navbar-brand" href="#" style="padding-left: 10px ;border-left: 4px solid blue;">Phim</a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="nav nav-underline">
                        <li class="nav-item">
                            <input type="button" value="Phim đang chiếu" class="nav-link" id="category-screening" onclick="show_pagination(this)">
                        </li>
                        <li class="nav-item">
                            <input type="button" value="Phim sắp chiếu" class="nav-link" id="category-soon" onclick="show_pagination(this)">
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
        <form class="d-flex" style="justify-content: right; margin-right:50px;">
            <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm" id="keySearch">
            <input type="button" value="Tìm kiếm" class="btn btn-outline-success">
        </form>
    </div>

    <!-- Content -->
    <div class="container">
        <!-- div bao film -->
        <div class="row justify-content-center product-grid-style" id="films_list" style="min-height: 800px;">

        </div>
        <div class="pagination_container" id="pagination_container">

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
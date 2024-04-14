// Hàm lấy danh sách phim truyền vào index (Vị trí bắt đầu lấy trong database) và category (loại phim) sử dụng ajax
function getFilms(index, category) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: './filmsController.php',
            method: 'POST',
            data: { 'action': 'get_films', 'index': index, 'category': category },
            dataType: 'JSON',
            success: data => {
                if (data && data.length > 0) {
                    try {
                        // Trả về mảng 
                        resolve(data);
                    } catch (error) {
                        // Trả về lỗi
                        reject(error);
                    }

                } else {
                    // Trả về lỗi
                    reject('Empty or invalid JSON data returned');
                }
            },
            error: function (xhr, status, error) {
                reject(error);
            }
        });
    });
}

// Hàm lấy số lượng trang truyền vào category (loại phim) sử dụng ajax
function getNumberPage(category) {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: './filmsController.php',
            method: 'POST',
            data: { 'action': 'get_number_page', 'category': category },
            dataType: 'JSON',
            success: data => {
                if (data && data.length > 0) {
                    try {
                        // Trả về số trang
                        resolve(data[0]['page']);
                    } catch (error) {
                        // trả về lỗi
                        reject(error);
                    }

                } else {
                    reject('Empty or invalid JSON data returned');
                }
            },
            error: function (xhr, status, error) {
                reject(error);
            }
        });
    });

}


// Hàm hiển thị phân trang
function show_pagination(category_current) {
    // Lấy loại phim
    let category_film = "AVAILABLE";

    // Kiểm tra trang có tải lại hay là chọn loại phim
    if (category_current) {
        const category_previous = document.querySelector('.navbar .active');// Loại phim trước đó
        category_previous.classList.remove('active');// Xoá active của loại phim trước đó
        category_current.classList.add('active');// Active loại phim hiện tại


        // Loại phim
        if (category_current.value === "Phim đang chiếu") {
            category_film = "AVAILABLE";
        }
        else if (category_current.value === "Phim sắp chiếu") {
            category_film = "COMING_SOON";
        }
    }
    else {
        var category_start = document.getElementById('category-screening'); // Loại phim mặc định
        if (category_start) {
            category_start.classList.add('active');
        }
    }

    // Gọi hàm ajax lấy số lượng trang
    getNumberPage(category_film).then(numberPage => {
        // Hàm in phân trang
        printPagination(numberPage);

        // Active trang đầu tiên
        var page_index = document.getElementById('page-index');
        if (page_index) {
            page_index.classList.add('active');
        }

        // Hiển thị danh sách phim
        show_films();
    }).catch(error => {
        console.error(error);
    });


}

// Hàm load trang
document.addEventListener('DOMContentLoaded', function () {
    show_pagination();
});

// Hàm hiển thị danh sách phim truyền vào page (btn trang) sử dụng ajax
function show_films(page) {
    // Lấy các element cần thiết
    let page_index = document.querySelector('#pagination_container .active');// Trang hiện tại
    const previous_button = document.getElementById('previous_button');// Nút previous
    const next_button = document.getElementById('next_button');// Nút next
    const category = document.querySelector('.navbar .active');// Loại phim

    // Xoá class active (button màu xanh) của trang cũ
    if (page_index) {
        page_index.classList.remove('active');
    }

    // Nếu Chọn trang khác
    if (page) {

        // Active trang hiện tại
        page.classList.add('active');

        // Số lượng trang
        const count_page = document.querySelectorAll('#pagination_container #page-index').length;

        // Loại phim
        let category_film = "";
        if (category) {
            if (category.value === "Phim đang chiếu") {
                category_film = "AVAILABLE";
            }
            else if (category.value === "Phim sắp chiếu") {
                category_film = "COMING_SOON";
            }
        }

        // Ẩn nút next và previous
        if (page.value == 1) {
            previous_button.classList.add('d-none');
            if (next_button) {
                next_button.classList.remove('d-none');
            }
        }
        else if (page.value == count_page) {
            next_button.classList.add('d-none');
            if (previous_button) {
                previous_button.classList.remove('d-none');
            }
        }
        else {
            previous_button.classList.remove('d-none');
            next_button.classList.remove('d-none');
        }

        // Tính vị trí 8 phim tiếp theo
        index = (page.value - 1) * 8;

        // Hiển thị danh sách phim
        getFilms(index, category_film).then(data => {
            printFilms(data);
        }).catch(error => {
            console.error(error);
        });

    }
    else {
        // Loại phim
        let category_film = "";
        if (category) {
            if (category.value === "Phim đang chiếu") {
                category_film = "AVAILABLE";
            }
            else if (category.value === "Phim sắp chiếu") {
                category_film = "COMING_SOON";
            }
        }

        // Trang đầu tiên index = 0 (tức các sản phẩm bắt đầu từ array[0])
        index = 0;

        // Hiển thị trang đầu tiên
        let active_pagin = document.getElementById('page-index');
        active_pagin.classList.add('active');

        // Ẩn nút previous
        previous_button.classList.add('d-none');

        // Hiển thị danh sách phim
        getFilms(index, category_film).then(data => {
            printFilms(data);
        }).catch(error => {
            console.error(error);
        });
    }
}

function previous_button_click() {
    let page_index = document.querySelector('#pagination_container .active');//Trang hiện tại
    const pages = document.querySelectorAll('#pagination_container #page-index');// Tất ca các trang

    // Nếu có tồn tại Trang current
    if (page_index) {
        // Chuyển trang current thành số
        let page_index_int = parseInt(page_index.value);

        // Tìm trang trước
        for (const key in pages) {
            if (pages[key].value == page_index_int - 1) {

                // Hiển thị trang trước
                show_films(pages[key]);
                break;
            }
        }
    }
}

function next_button_click() {
    let page_index = document.querySelector('#pagination_container .active');//Trang hiện tại
    const pages = document.querySelectorAll('#pagination_container #page-index');// Tất ca các trang

    // Nếu có tồn tại Trang current
    if (page_index) {
        // Chuyển trang current thành số
        let page_index_int = parseInt(page_index.value);

        // Tìm trang tiếp theo
        for (const key in pages) {
            if (pages[key].value == page_index_int + 1) {

                // Hiển thị trang tiếp theo
                show_films(pages[key]);
                break;
            }
        }
    }
}


function printFilms(films) {
    // Chuỗi HTML chứa danh sách phim
    let str = "";
    for (const key in films) {
        str += `<div class="col-11 col-sm-6 col-lg-4 col-xl-3" id="show_film">
                    <div class="product-details">
                        <div class="product-img">
                            <img class="rounded-3" src ='${films[key]['poster_url']}' id="image-poster" alt ="...">
                            <div class="product-cart">
                                <a href="#!"><i class="fa-solid fa fa-eye">Trailer</i></a>
                                <a href="#!"><i class="fas fa-cart-plus">Đặt vé</i></a>
                            </div>
                        </div>
                        <div class="product-info">
                            ${films[key]['movie_name']}
                        </div>
                    </div>
                </div>`;
    }

    // In chuỗi HTML ra màn hình
    const filmsContainer = document.getElementById("films_list");
    filmsContainer.innerHTML = str;
}

function printPagination(numberPage) {
    // Chuỗi HTML chứa phân trang
    let str = `<nav aria-label="Page navigation example"><ul class="pagination"><li class="page-item"><input type="button" value="Previous" id="previous_button" class="page-link" onclick="previous_button_click()"></li>`;
    for (let i = 1; i <= numberPage; i++) {
        str += `<li class="page-item"><input type="button" class="page-link" id="page-index" value="${i}" onclick="show_films(this)"></li>`;
    }
    str += `<li class="page-item"><input type="button" value="Next" id="next_button" class="page-link" onclick="next_button_click()"></li></ul></nav>`;

    const paginationContainer = document.getElementById("pagination_container");
    paginationContainer.innerHTML = str;
}

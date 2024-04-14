
//Hàm chuyển lịch chiếu trong trang chi tiết phim
const initSlider = () => {
    const showTimesList = document.querySelector('.slider-showtimes .list-date');
    const sildeButtons = document.querySelectorAll('.slider-showtimes .slide-button');

    sildeButtons.forEach(button => {
        button.addEventListener('click', () => {
            const direction = button.id === 'prev-slide' ? -1 : 1;
            const scrollAmount = showTimesList.clientWidth * direction;
            showTimesList.scrollBy({
                left: scrollAmount,
                behavior: 'smooth'
            });
        });
    });
}


window.addEventListener('load', initSlider);
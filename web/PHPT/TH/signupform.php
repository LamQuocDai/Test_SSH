<div id="signup">
            <form id="signup_form">
                <button type="button" class="close" onclick="open_login()">+</button>
                <h2>ĐĂNG KÝ</h2>
                <div class="signupinfo">
                    <div class="col">
                        <div class="txt_field_register">
                            <input type="text" id="full_name" required>
                            <span></span>
                            <label for="full_name">Họ tên </label>
                            <div id="full_name_error">Bạn chưa nhập họ tên</div>
                        </div>
                        <div class="txt_field_register">
                            <input type="text" id="birth_date" required>
                            <span></span>
                            <label for="birth_date">Ngày sinh </label>
                            <div id="birth_date_error">Bạn chưa ngày sinh</div>
                        </div>
                        <div class="txt_field_register">
                            <input type="text" id="phone" required>
                            <span></span>
                            <label for="phone">Số điện thoại </label>
                            <div id="phone_error">Bạn chưa nhập số điện thoại</div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="txt_field_register">
                            <input type="text" id="email" required>
                            <span></span>
                            <label for="email">Email </label>
                            <div id="email_error">Bạn chưa nhập email</div>
                        </div>
                        <div class="txt_field_register">
                            <input type="password" id="password_register" required>
                            <span></span>
                            <label for="password_register">Mật khẩu </label>
                            <div id="password_register_error">Bạn chưa nhập mật khẩu</div>
                        </div>
                        <div class="txt_field_register">
                            <input type="password" id="password_register2" required>
                            <span></span>
                            <label for="password_register2">Nhập lại mật khẩu</label>
                            <div id="password_register2_error">Mật khẩu không trùng khớp</div>
                        </div>

                    </div>
                </div>
                <button type="submit" id="btnsignup">Đăng ký</button>
                <p>Trở về trang <a href="#" onclick="open_signup()">Đăng nhập</a></p>
            </form>
        </div>
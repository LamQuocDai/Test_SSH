<div id="header" class="header">
    <a href="#" onclick="open_login()">Đăng nhập</a>
    <label><?php
            session_start();
            if (isset($_SESSION['email'])) {
                $email_login = $_SESSION['email'];
                echo "Xin chào " . $email_login;
            } ?></label>
    <a href="destroysession.php">Đăng xuất</a>
</div>
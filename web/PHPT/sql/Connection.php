<?php
// Các phương thức kết nối
$conn = mysqli_connect("localhost", "root", "", "cinema_manager"); // Phương thức Mysql mysqli_connect(servername,username,password,databasename)
define('DATABASE_SERVER', 'localhost'); // Tạo biến define
define('DATABASE_USER', 'root');
define('DATABASE_PASSWORD', '');
define('DATABASE_NAME', 'school');
$conn1 = new PDO("mysql:host=" . DATABASE_SERVER . ";dbname=" . DATABASE_NAME, DATABASE_USER, DATABASE_PASSWORD); //Phương thức PDO

if ($conn->connect_error) {
    die('Could not connect:' . $conn->connect_error); // Nếu kết nối thất bại
}
echo "Kết nối thành công";

// LỆNH SELECT
$result = mysqli_query($conn, "SELECT * FROM users");
while ($row = mysqli_fetch_array($result)) {
    // Tìm hiểu về mysqli_fetch_array(), mysqli_fetch_assoc() (associative array ['key']['value']),
    // mysqli_fetch_row(), mysqli_fetch_object() Tài liệu thầy Sang(PHP Tutorial) trang 73,84,75
    echo $row['user_id'] . " - " . $row['email'] . " - " . $row['fullName'] . " - " . $row['password'] . "<br>";
}

// LỆNH INSERT
mysqli_query($conn, "INSERT INTO products (product_id,product_name,product_price) VALUES ('1','Bap','50000')");

// LỆNH UPDATE
mysqli_query($conn, "UPDATE products SET `product_name` = 'Pepsi' WHERE `product_id` = '1'");

// LỆNH DELETE
mysqli_query($conn, "DELETE FROM products WHERE product_name = 'Pepsi'");

mysqli_close($conn);

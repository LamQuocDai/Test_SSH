<?php
class DatabaseConnection
{
    // bien static connection
    public static $conn = null, $instance = null, $message = '';

    private function __construct()
    {
        try {
            // chuoi ket noi
            #$dsn = 'mysql:dbname='.$database_config['database'].';host='.$database_config['host'];
            $dsn = "mysql:dbname=cinema_manager;host=localhost";
            // Cau hinh option: Cau hinh utf8 va ngoai le khi truy van loi
            $option = [
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ];
            //Cau lenh ket noi
            self::$conn = new PDO($dsn, "root", '', $option);
        } catch (Exception $e) {
            self::$message = $e->getMessage();
            die();
        }
    }

    public static function getInstance()
    {
        if (self::$instance == null) {
            new DatabaseConnection();
            self::$instance = self::$conn;
        }
        return self::$instance;
    }

    public function query($sql)
    {
        try {
            $statement = self::$conn->prepare($sql);
            return $statement;
        } catch (Exception $e) {
            self::$message = $e->getMessage();
            die();
        }
    }
}
?>
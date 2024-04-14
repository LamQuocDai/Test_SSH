<?php
include "testDTO.php";
class Connection
{
    private static $conn = null;
    public function __construct()
    {
        try {
            self::$conn = new PDO('mysql:host=localhost;dbname=dai;charset=utf8', 'root', '');
            echo "Database connected";
        } catch (Exception $e) {
            echo $e->getMessage();
            die();
        }
    }
    public static function getConnection()
    {
        new Connection();
        return self::$conn;
    }
    public static function query($sql)
    {
        try {
            $conn = Connection::getConnection();
            $statement = $conn->query($sql);
            $query = $statement->fetchAll(PDO::FETCH_ASSOC);
            return $query;
        } catch (Exception $e) {
            echo $e->getMessage();
            die();
        }
    }

    public static function prepareInsert($name, $age)
    {
        try {
            $conn = Connection::getConnection();
            $statement = $conn->prepare("INSERT INTO test(name,age) VALUES (?,?)");
            $statement->bindValue(1, $name);
            $statement->bindValue(2, $age);
            $statement->execute();
            return $statement;
        } catch (Exception $e) {
            echo $e->getMessage();
            die();
        }
    }

    public static function prepareUpdate($name, $age, $id)
    {
        try {
            $conn = Connection::getConnection();
            $statement = $conn->prepare("UPDATE test SET name = ?,age = ? WHERE ID = ?");
            $statement->bindValue(1, $name);
            $statement->bindValue(2, $age);
            $statement->bindValue(3, $id);
            $statement->execute();
            return 1;
        } catch (Exception $e) {
            echo $e->getMessage();
            die();
        }
    }
}

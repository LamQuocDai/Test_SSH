<?php
class FilmsDAL
{
    private $conn = null;
    public function __construct()
    {
    }

    public function getConnection()
    {
        try {
            $option = [
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ];
            $this->conn = new PDO("mysql:host=localhost;dbname=cinema_manager", "root", "", $option);
        } catch (Exception $e) {
            echo $e->getMessage();
            exit; // Stop execution if there is an error
        }
    }

    public function getFilms($index, $category)
    {
        $this->getConnection();
        $sql = "SELECT * FROM movies WHERE movie_status = '$category' ORDER BY movie_id LIMIT $index,8";
        $result = $this->conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $result;
    }

    public function getNumberPage($category)
    {
        $this->getConnection();
        $sql = "SELECT CEILING(COUNT(movie_id)/8) AS page FROM movies WHERE movie_status = '$category'";
        $result = $this->conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $result;
    }
}

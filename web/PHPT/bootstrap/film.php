<?php
if (isset($_GET['q'])) {
    $q = intval($_GET['q']);

    try {
        $option = [
            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ];
        $conn = new PDO("mysql:host=localhost;dbname=cinema_manager", "root", "", $option);
    } catch (Exception $e) {
        echo $e->getMessage();
        exit; // Stop execution if there is an error
    }

    $sql = "SELECT * FROM movies WHERE movie_status = 'AVAILABLE' ORDER BY movie_id LIMIT $q,8";
    $result = $conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);

    // Close the database connection
    $conn = null;

    // Check if there are results before encoding to JSON
    if ($result) {
        array_walk_recursive($result, function (&$value) {
            $value = mb_convert_encoding($value, 'UTF-8', 'UTF-8');
        });

        $json = json_encode($result);
        if ($json === false) {
            echo "JSON encoding error: " . json_last_error_msg();
        } else {
            //header('Content-Type: application/json');
            echo $json;
        }
    } else {
        echo json_encode(array()); // Return an empty array if no results found
    }
} else {
    echo "No 'q' parameter provided";
}

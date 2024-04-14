<?php
include "connection.php";
$db = DatabaseConnection::getInstance();
$query = $db->query("Select email,password from users");
$result = $query->fetchAll(PDO::FETCH_ASSOC);

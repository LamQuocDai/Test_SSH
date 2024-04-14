<?php
if (isset($_POST['btn_login'])) {
    $email = htmlspecialchars($_POST['email']);
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    }
    $password = htmlspecialchars(($_POST['password']));

    include "connection.php";
    $db = DatabaseConnection::getInstance();
    $query = $db->query("Select password,count(email) from users where email = '$email'");
    $result = $query->fetchAll(PDO::FETCH_ASSOC);
    if ($result[0]['count(email)'] == 1) {
        if ($password == $result[0]['password'] || password_verify($password,  $result[0]['password'])) {
            session_start();
            $_SESSION['email'] = $email;
            header("Location: Tuan2.php");
        }
    } else {
    }
}

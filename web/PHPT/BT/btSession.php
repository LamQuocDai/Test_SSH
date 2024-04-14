<?php
session_start();
if (isset($_POST['username']) && isset($_POST['password'])) {
    $name = $_POST['username'];
    $pass = $_POST['password'];

    if ($name == 'a' && $pass == 'a') {
        if (isset($_POST['remember'])) {
            $_SESSION['username'] = $name;
            $_SESSION['password'] = $pass;
        } else {
            session_destroy();
        }
        header('Location: index.php');
    } else {
        echo "Dang nhap that bai";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="post">
        <div>
            <label for="name">User:</label>
            <input type="text" value="<?php if (isset($_SESSION['username'])) {
                                            echo $_SESSION['username'];
                                        } ?>" name="username">
        </div>
        <div>
            <label for="pass">Password:</label>
            <input type="password" value="<?php if (isset($_SESSION['password'])) {
                                                echo $_SESSION['password'];
                                            } ?>" name="password">
        </div>
        <input type="checkbox" <?php if (isset($_SESSION['username'])) {
                                                    echo 'checked';
                                                } ?> name="remember"> remember pass <br>
        <input type="submit" value="Login">
    </form>
</body>

</html>
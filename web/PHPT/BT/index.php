<?php
echo "Dang nhap thanh cong";
if (isset($_POST['logout'])) {
    header('Location: btSession.php');
}
?>

<html>
<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="post"> <input type="submit" value="Log out" name="logout"></form>

</html>
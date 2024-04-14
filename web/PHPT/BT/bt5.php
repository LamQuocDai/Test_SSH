<?php
if (isset($_POST['txtX'])) {
    $x = $_POST['txtX'];
    $y = $x;
        if ($x >= 2) {
        $y = -8 * $x * $x * $x - 12 * $x - 1;
    } else if ($x > 1 && $x < 2) {
        $y = $x * $x - 6 * $x - 19;
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
    <div>biểu thức</div>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="POST">
        X: <input type="number" step="any" value="<?php if (isset($_POST['txtX'])) {
                                            echo $x;
                                        } ?>" name="txtX">
        <br>
        <div><?php if (isset($_POST['txtX'])) {
                    echo "y = f($x) = $y ";
                } ?></div>
        <br>
        <input type="submit" value="Tinh">
    </form>
</body>

</html>
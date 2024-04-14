<?php
if (isset($_POST['txtN'])) {
    $n = $_POST['txtN'];
    $S = 0;
    for ($i = 1; $i <= $n; $i++){
        $S += ($i/($i+1));
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
        N: <input type="number" value="<?php if (isset($_POST['txtN'])) {
                                            echo $n;
                                        } ?>" name="txtN">
        <br>
        <div><?php if (isset($_POST['txtN'])) {
                    echo "S = $S";
                } ?></div>
        <br>
        <input type="submit" value="Tinh">
    </form>
</body>

</html>
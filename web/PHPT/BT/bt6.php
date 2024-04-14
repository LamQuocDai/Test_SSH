<?php
if (isset($_POST['txtX'])&& isset($_POST['txtY']) && isset($_POST['txtZ'])) {
    $x = $_POST['txtX'];
    $y = $_POST['txtY'];
    $z = $_POST['txtZ'];
    $max = $x;
    if ($max < $y) {
        $max = $y;
    }
    if ($max < $z){
        $max = $z;
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
        X: <input type="number" value="<?php if (isset($_POST['txtX'])) {
                                            echo $x;
                                        } ?>" name="txtX">
        Y: <input type="number" value="<?php if (isset($_POST['txtY'])) {
                                            echo $y;
                                        } ?>" name="txtY">
        Z: <input type="number" value="<?php if (isset($_POST['txtZ'])) {
                                            echo $z;
                                        } ?>" name="txtZ">
        <br>
        <div><?php if (isset($_POST['txtX'])) {
                    echo "Max($x,$y,$z) = $max";
                } ?></div>
        <br>
        <input type="submit" value="Tim">
    </form>
</body>

</html>
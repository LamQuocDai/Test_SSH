<?php
if (isset($_POST['txtX']) && isset($_POST['txtY']) && isset($_POST['txtZ']) && isset($_POST['txtU'])) {
    $x = $_POST['txtX'];
    $y = $_POST['txtY'];
    $z = $_POST['txtZ'];
    $u =  $_POST['txtU'];
    $max = $x;
    $maxnext = $y;
    if ($max < $maxnext) {
        $max = $y;
        $maxnext = $x;
    }
    if ($max < $z) {
        $maxnext = $max;
        $max = $z;
    }
    else{
        if($maxnext < $z){
            $maxnext = $z;
        }
    }
    if ($max < $u) {
        $maxnext = $max;
        $max = $u;
    }
    else{
        if($maxnext < $u){
            $maxnext = $u;
        }
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
        U: <input type="number" value="<?php if (isset($_POST['txtU'])) {
                                            echo $u;
                                        } ?>" name="txtU">
        <br>
        <div><?php if (isset($_POST['txtX'])) {
                    echo "Max2nd($x,$y,$z,$u) = $maxnext";
                } ?></div>
        <br>
        <input type="submit" value="Tim">
    </form>
</body>

</html>
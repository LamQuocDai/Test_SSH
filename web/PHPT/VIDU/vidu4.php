<?php
if (isset($_GET['php'])) {
    $a = $_GET['txtA'];
    $b = $_GET['txtB'];
    $c = $a + $b;
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
    <div>TINH TONG</div>
    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) ?>" method="get">
        A: <input type="number" value="<?php if (isset($_GET['php'])) {
                                            echo $a;
                                        } ?>" name="txtA">
        <br>
        B: <input type="number" value="<?php if (isset($_GET['php'])) {
                                            echo $b;
                                        } ?>" name="txtB">
        <br>
        <div><?php if (isset($_GET['php'])) {
                    echo "Tong cua $a + $b la: $c";
                } ?></div>
        <br>
        <input type="submit" value="Tinh" name="php">
    </form>
</body>

</html>
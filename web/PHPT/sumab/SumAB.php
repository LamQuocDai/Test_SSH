<?php
if (isset($_POST['txtSoA'])) {
    $soA =  $_POST['txtSoA'];
    $soA = (int)$soA;
    $soB = $_POST['txtSoB'];
    $soB = (int)$soB;
    $pt = $_POST['txtPT'];
    $ket_qua = 0;

    switch ($pt) {
        case '1':
            $ket_qua = $soA + $soB;
            break;
        case '2':
            $ket_qua = $soA - $soB;
            break;
        case '3':
            $ket_qua = $soA * $soB;
            break;
        case '4':
            $ket_qua = $soA / $soB;
            break;
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="index.js"></script>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div>
        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="post">
            <div class="element">
                <label for="so-a" class="so-a">So A: </label>
                <input type="number" value="<?php if(isset($_POST['txtSoA'])) echo $soA; ?>" name="txtSoA" id="so-a">
            </div>
            <div class="element">
                <label for="so-b" class="so-b">So B: </label>
                <input type="number" value="<?php if(isset($_POST['txtSoA'])) echo $soB; ?>" name="txtSoB" id="so-b">
            </div>
            <div class="element">
                <label for="ket-qua" class="ket-qua">Ket qua: </label>
                <input type="text" value="<?php if(isset($_POST['txtSoA'])) echo $ket_qua; ?>" name="ket-qua" id="ket-qua" readonly>
            </div>
            <div class="element">
                <label for="phep-tinh" class="phep-tinh">Phep tinh: </label>
                <select name="txtPT" id="phep-tinh">
                    <option value="1">+
                    </option>
                    <option value="2">-
                    </option>
                    <option value="3">x
                    </option>
                    <option value="4">/
                    </option>
                </select>
            </div>
            <div class="button">
                <input type="button" onclick="Sum()" value="js">
                <input type="submit" value="php" name="php">
            </div>
        </form>
    </div>
</body>

</html>
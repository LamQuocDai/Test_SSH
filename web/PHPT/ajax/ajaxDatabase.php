<?php
if (isset($_GET['q'])) {
    $q = intval($_GET['q']);

    try {
        $option = [
            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        ];
        $conn = new PDO("mysql:host=localhost;dbname=cinema_manager", "root", "", $option);
        echo "Ket noi thanh cong";
    } catch (Exception $e) {
        echo $e->getMessage();
    }

    $sql = "SELECT * FROM users";
    $result = $conn->query($sql)->fetchAll(PDO::FETCH_ASSOC);

    print_r($result);

    echo "<table>
<tr>
<th>email</th>
<th>Name</th>
<th>phone</th>
<th>birth day</th>
<th>create date</th>
</tr>";
    $str = '';
    foreach ($result as $row) {
        $str .= "<tr><td>" . $row['email'] . "</td>"
            . "<td>" . $row['full_name'] . "</td>"
            . "<td>" . $row['phone'] . "</td>"
            . "<td>" . $row['birthdate'] . "</td>"
            . "<td>" . $row['created_date'] . "</td></tr>";
    }

    echo $str;

    echo "</table>";

    $conn = null;
}

?>

<html>

<head>
    <script>
        function showUser() {
            if (str == "") {
                document.getElementById("txtHint").innerHTML = "";
                return;
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("txtHint").innerHTML = this.responseText;
                    }
                };
                xmlhttp.open("GET", "ajaxDatabase.php?q=" + str, true);
                xmlhttp.send();
            }
        }
    </script>
</head>

<body>
    <div id="txtHint"><b>Person info will be listed here...</b></div>

</body>
<script>
    window.onload = function() {
        showUser();
    }
</script>


</html>
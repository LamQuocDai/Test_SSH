<?php
include "Connection.php";
$users = Connection::query("SELECT * FROM test");
echo "<pre>";
print_r($users);
echo "</pre>";

<?php
$f = fopen('text.txt', 'w') or exit("Unable open file");
$s = "\n hello world";
fwrite($f, $s);
fclose($f);

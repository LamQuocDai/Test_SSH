<?php
$f = fopen('text.txt', 'r') or Exit("Unable open file");
while (!feof($f)) {
    echo fgetc($f);
}
fclose($f);
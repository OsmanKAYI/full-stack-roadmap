<?php

@session_start();
echo "<pre>";
print_r($_SESSION);
echo "</pre>";

echo "<p>işlem tamam</p>";
echo "<p><a href='index.php'>Geri dön</a></p>";

<?php

@session_start();

$_SESSION["user"] = "Nuri";

$_SESSION["flash_message"] = "Değişken set edildi...";

echo "<p>işlem tamam</p>";
echo "<p><a href='index.php'>Geri dön</a></p>";
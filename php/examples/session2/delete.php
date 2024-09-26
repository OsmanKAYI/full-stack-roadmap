<?php

@session_start();

unset($_SESSION["user"]); // Tek değişken için

session_destroy(); // O session ile oluşturulan TÜM değişenler

echo "<p>işlem tamam</p>";
echo "<p><a href='index.php'>Geri dön</a></p>";
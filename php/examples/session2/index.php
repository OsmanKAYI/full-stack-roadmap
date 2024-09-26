<?php 
@session_start();
if( isset($_SESSION["flash_message"]) ) {
  echo "<h5>Uyarı Mesajı:</h5>";
  echo "<h1>{$_SESSION["flash_message"]}</h1>";
  unset($_SESSION["flash_message"]);
}
if( isset($_GET["sonuc"]) and $_GET["sonuc"] = 1) echo "HATA OLUŞTU";

?>

<a href='set.php'><p>user="nuri" sesion değişkenini tanımla</p></a>

<a href='list.php'><p>tüm sesion değişkeninin değerini göster</p></a>

<a href='show_hatali.php'><p>user sesion değişkeninin değerini göster (yapamaz)</p></a>

<a href='delete.php'><p>user sesion değişkeninini sil</p></a>

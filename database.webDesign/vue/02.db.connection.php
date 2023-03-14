<?php

// Veritabanına bağlanma hazırlık
$host    = "localhost";
$dbname  = "yakit_izleme";
$user    = "root";
$pass    = "root";

$options = [
  PDO::ATTR_EMULATE_PREPARES   => false, // turn off emulation mode for "real" prepared statements
  PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, //turn on errors in the form of exceptions
  PDO::MYSQL_ATTR_FOUND_ROWS   => true, // Normally if you update your table with the same values, it'll return 0.
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, //make the default fetch be an associative array
];

// Veritabanına bağlanma
try { $pdo=new PDO("mysql:host=$host;port=3306;dbname=$dbname;charset=utf8", $user,$pass, $options); }
catch (PDOexception $e){ die( "Veritabanına bağlanılamadı... " ); } // $e->getMessage()
  
// include("d2.library.php");



	// $arrFIRMABILGILERI dizisini UETDS erişim bilgileri ile dolduralım
  
  $islem = $_GET['islem'];

  if($islem == "suruculer") {
    $stmt = $pdo->prepare("SELECT * FROM d2_suruculer ORDER BY adsoyad");
    $stmt->execute();
    $arrKayitlar = $stmt->fetchAll();
  }

  if($islem == "araclar") {
    $stmt = $pdo->prepare("SELECT * FROM d2_araclar ORDER BY plaka");
    $stmt->execute();
    $arrKayitlar = $stmt->fetchAll();
  }

  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");

  echo json_encode($arrKayitlar);
  
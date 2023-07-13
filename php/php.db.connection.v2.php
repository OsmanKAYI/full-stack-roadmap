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
  
/// include("d2.library.php");

  $arrTablolar = array();

  $SQL = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '{$dbname}'";
  $stmt = $pdo->prepare($SQL);
  $stmt->execute();
  $tmp1 = $stmt->fetchAll();
  foreach ($tmp1 as $key1 => $value1) {
    $tabloAdi = $tmp1[$key1]['TABLE_NAME'];
    $arrTablolar[ $tabloAdi ] = "";

      $SQL = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '{$dbname}' AND TABLE_NAME = '{$tabloAdi}' ";
      $stmt = $pdo->prepare($SQL);
      $stmt->execute();
      $tmp2 = $stmt->fetchAll();
      $arrKolonlar = array();
      foreach ($tmp2 as $key2 => $value2) {
        $kolonAdi = $tmp2[$key2]['COLUMN_NAME'];
        $arrKolonlar[ $kolonAdi ] = "";
      } // Tablonun Kolonları için
      $arrTablolar[ $tabloAdi ] = $arrKolonlar;

  } // Tablolar için


  $myTable = "";
  if( isset($arrTablolar[ $_GET["tablo"] ]) ) {
    $myTable = $_GET["tablo"];
  } else {
    die("Hatalı sorgu");
  }

	// $arrFIRMABILGILERI dizisini UETDS erişim bilgileri ile dolduralım
  
  // $islem = $_GET['islem'];

  $arrFields = $arrTablolar[ $myTable ];

  foreach ($arrFields as $key => $value) {
  
    if( isset( $_GET[$key] )) {
      $arrFields[$key] = $_GET[$key];
    } else {
      unset($arrFields[$key]);
    }

  } // foreach

  $myWhere = "";

  if( count($arrFields) > 0 ) {
    // Süzme olacak
    $arrSonuc = array();
    foreach ($arrFields as $key => $value) {
      $arrSonuc[] = "{$key} = \"{$value}\"";
    }
    $myWhere = "WHERE " . implode(" AND ", $arrSonuc);
  } else {
    $myWhere = "";
  }

  $SQL = "SELECT * FROM {$myTable} {$myWhere}";
 
  $stmt = $pdo->prepare($SQL);
  $stmt->execute();
  $arrKayitlar = $stmt->fetchAll();
  
  $arrKayitlar["adet"] = count($arrKayitlar);

  header("Access-Control-Allow-Origin: *");
  header("Content-Type: application/json; charset=UTF-8");

  echo json_encode($arrKayitlar);

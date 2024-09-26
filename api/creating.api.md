# Creating an API

- The API can be created with using PHP language. APIs are mechanisms that enable two software components to communicate with each other using a set of definitions and protocols. Let's create an api to collect some informations.

- Say,we got a database connection dealed with _db.php_ and a table called _referendum_ which has columns of _id_, _city_, _town_, and etc.

- Api to collect all the cities

```php
<?php

require_once('db.php');

$stmt = $conn->prepare("SELECT city FROM referendum GROUP BY city ORDER BY city");
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
//echo '<pre>'; print_r($rows);

$arr = array();

foreach($rows as $row) {
  $arr["cities"][] = $row["city"];
}

if(count($rows) == 0){
  $arr["error"] = "City Not Found";
}else{
  $arr["error"] = "";
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($arr, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
```

- Api to collect all the towns

```php
<?php

require_once('db.php');

$city = $_POST['city'];

$stmt = $conn->prepare("SELECT city , town FROM referendum WHERE city = :city ");
$stmt->bindParam(':city', $city);   // güvenlik için bind ederek kullanıyoruz !!!
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
//echo '<pre>'; print_r($rows);

$arr = array();

foreach($rows as $row) {
  $arr["towns"][] = $row["town"];
}

if(count($rows) == 0){
  $arr["error"] = "City Not Found";
}else{
  $arr["error"] = "";
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($arr, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
```

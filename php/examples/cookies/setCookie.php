<?php

$cookie_name  = $_POST['cookie_name'];
$cookie_value = $_POST['cookie_value'];

$Time = 0;
switch ($_POST['interval']) {
  case '20s':
    $Time = 20;
    break;
  case '1m':
    $Time = 60;
    break;
  case '1y':
    $Time = 60 * 60 * 24 * 365;
    break;
}

setcookie($cookie_name, $cookie_value, [
  'expires' => time() + $Time,
  'path' => '/',
  'httponly' => true,
  'secure' => true,
  'samesite' => 'None',
]);

header('location: success.html');
<?php

// Clear a cookie with $_POST
if (isset($_POST['clear_cookie'])) {
  $cookie_name = $_POST['cookie_name'];
  setcookie($cookie_name, '', time() - 10);
}

// Clear a cookie with $_GET
if (isset($_GET['cookiename'])) {
  $cookie_name = $_GET['cookiename'];
  setcookie($cookie_name, '', time() - 10);
}

header('location: success.html');


<?php

// List all cookies
$cookies = $_COOKIE;
if (!empty($cookies)) {
  echo "<h2>List of Cookies:</h2>";
  echo "<ul>";
  foreach ($cookies as $name => $value) {
      echo "<li>$name: $value <a href='clearCookie.php?cookiename={$name}'>Sil</a></li>";
  }
  echo "</ul>";
}
?>

<html>

  <p><a href='index.html'> Homepage </a></p>

</html>
<?php

session_start();

// List all sessions
$sessions = $_SESSION;
if (!empty($sessions)) {
  echo "<h2>List of Sessions:</h2>";
  echo "<ul>";
  foreach ($sessions as $name => $value) {
      echo "<li>$name: $value </li>";
  }
  echo "</ul>";
}
?>

<html>

  <p><a href='index.php'> Homepage </a></p>

</html>
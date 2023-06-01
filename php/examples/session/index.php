<!DOCTYPE html>
<html>

<head>
  <title>User Registration</title>
</head>

<body>
  <h1>User Registration</h1>

  <form method="POST" action="sessionStart.php">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name" value="<?php echo isset($_POST['name']) ? $_POST['name'] : ''; ?>"
      required><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" value="<?php echo isset($_POST['email']) ? $_POST['email'] : ''; ?>"
      required><br>

    <label for="password">Password:</label>
    <input type="password" name="password" id="password" required><br>

    <input type="submit" value="Register">
  </form>

  <p><a href='listSession.php'> List Sessions </a></p>

</body>

</html>
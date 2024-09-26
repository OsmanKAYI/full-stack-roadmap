<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process the registration form
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Validate the form data (add your own validation logic here)
    $errors = [];
    if (empty($name)) {
        $errors[] = "Name is required.";
    }
    if (empty($email)) {
        $errors[] = "Email is required.";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Invalid email format.";
    }
    if (empty($password)) {
        $errors[] = "Password is required.";
    } elseif (strlen($password) < 6) {
        $errors[] = "Password must be at least 6 characters long.";
    }

    if (count($errors) === 0) {
        // Registration successful, store user information in session
        $_SESSION['user'] = [
            'name' => $name,
            'email' => $email
        ];

        // Redirect to a success page or perform other actions
        header("Location: success.html");
        exit();
    } elseif (isset($errors) && count($errors) > 0) {
        foreach ($errors as $error);
        echo $error;
        
        $timeOut = 3;
        header( "refresh:$timeOut; url=index.php" );

        echo 'You will be redirected in about ' . $timeOut . ' secs.<br>';
        echo 'If not, please click <a href="index.php">here</a>.';
    }
}

?>

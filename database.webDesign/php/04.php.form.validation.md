# Text Fields

The name, email, and website fields are text input elements, and the comment field is a textarea. The HTML code looks like this:

```PHP
Name: <input type="text" name="name">
E-mail: <input type="text" name="email">
Website: <input type="text" name="website">
Comment: <textarea name="comment" rows="5" cols="40"></textarea>
```

# Radio Buttons

The gender fields are radio buttons and the HTML code looks like this:

```PHP
Gender:
<input type="radio" name="gender" value="female">Female
<input type="radio" name="gender" value="male">Male
<input type="radio" name="gender" value="other">Other
```

# The Form Element

The HTML code of the form looks like this:

```PHP
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
```

When the form is submitted, the form data is sent with method="post".

## What is the $\_SERVER["PHP_SELF"] variable?

The $\_SERVER["PHP_SELF"] is a super global variable that returns the filename of the currently executing script.

So, the $\_SERVER["PHP_SELF"] sends the submitted form data to the page itself, instead of jumping to a different page. This way, the user will get error messages on the same page as the form.

## What is the htmlspecialchars() function?

The htmlspecialchars() function converts special characters to HTML entities. This means that it will replace HTML characters like < and > with &lt; and &gt;. This prevents attackers from exploiting the code by injecting HTML or Javascript code (Cross-site Scripting attacks) in forms.

# Validate Form Data With PHP

- The first thing we will do is to pass all variables through PHP's htmlspecialchars() function.

- When we use the htmlspecialchars() function; then if a user tries to submit the following in a text field:

```HTML
<script>location.href('http://www.hacked.com')</script>
```

- this would not be executed, because it would be saved as HTML escaped code, like this:

```HTML
&lt;script&gt;location.href('http://www.hacked.com')&lt;/script&gt;
```

- The code is now safe to be displayed on a page or inside an e-mail.

- We will also do two more things when the user submits the form:

1. Strip unnecessary characters (extra space, tab, newline) from the user input data (with the PHP trim() function)
2. Remove backslashes (\) from the user input data (with the PHP stripslashes() function)

- The next step is to create a function that will do all the checking for us (which is much more convenient than writing the same code over and over again).

- We will name the function test_input().

- Now, we can check each $\_POST variable with the test_input() function, and the script looks like this:

### Example

```PHP
<?php
// define variables and set to empty values
$name = $email = $gender = $comment = $website = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $name = test_input($_POST["name"]);
  $email = test_input($_POST["email"]);
  $website = test_input($_POST["website"]);
  $comment = test_input($_POST["comment"]);
  $gender = test_input($_POST["gender"]);
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>
```

**Ref:** https://www.w3schools.com/php/php_form_validation.asp

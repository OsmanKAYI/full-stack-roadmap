# Push Notifications Using PHP, MySQL, and Firebase Cloud Messaging

This article explores push notifications, their types, use cases, and how they function, along with a practical example using PHP and MySQL.

> 🔔 **Push notifications** are messages sent from a server to a user’s device, such as a smartphone, desktop, or tablet, delivering information directly, even when the user isn’t actively using the application.

These notifications can manifest as pop-ups, banners, or icons on the device’s screen, often utilized by mobile apps and websites to share timely updates, reminders, and information.

Push notifications operate using a “push” mechanism, where the server proactively sends data to the client rather than waiting for the client to request it. Here’s a breakdown of key elements:

## 📢 **Types of Push Notifications**

- **Mobile Push Notifications**: Delivered to mobile devices via services like Apple Push Notification Service (APNs) for iOS and Firebase Cloud Messaging (FCM) for Android.
- **Web Push Notifications**: Displayed on desktop or mobile web browsers, using protocols like the Web Push API to send messages to users even when they’re not on the website.

## 📢 **Use Cases**

- **Updates and Alerts**: News and social media apps send breaking news or activity notifications.
- **Engagement and Retention**: Apps utilize push notifications to encourage user return through reminders or personalized messages.
- **Transactional Information**: E-commerce or banking apps send purchase confirmations, shipment tracking updates, or low balance alerts.

## 📢 **How They Work**

1. **Opt-In**: Users must grant permission to receive push notifications.
2. **Unique Token**: The device registers with a push notification service (e.g., FCM), generating a unique token for that device and application.
3. **Server Communication**: The application server stores this token and uses it to send targeted messages through the push service, which delivers them to the device.

Push notifications are valued for their real-time communication capabilities, ideal for applications that need to keep users informed and engaged. However, they should be used judiciously to avoid overwhelming users with excessive alerts.

Here’s a step-by-step guide on setting up **push notifications with PHP and MySQL** using **Firebase Cloud Messaging (FCM)**.

## Step 1: Setting Up Firebase 💥

![Firebase Setup](https://miro.medium.com/v2/resize:fit:250/1*uvIBPrdxG9Ww6pbg8IsI1w.png)

1. Go to the Firebase Console and create a new project.
2. Navigate to **Project Settings**.
3. In **Cloud Messaging**, find the **Server Key** and **Sender ID** needed for sending notifications.
4. Add Firebase to your web app by going to **Project Settings > General** and clicking **Add app** (select the web icon for web apps).

Follow the instructions and copy the `firebaseConfig` object for use in your frontend.

## Step 2: Configure MySQL Database 💦

![MySQL Database Setup](https://miro.medium.com/v2/resize:fit:250/1*8Xj3ZselwBEY-CPbQ0kxSQ.png)

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

CREATE TABLE user_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    token VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

- The users table stores basic user information.
- The user_tokens table keeps each user’s Firebase token, allowing targeted notifications.

## Step 3: Frontend Setup for Receiving Notifications

1. Add Firebase Scripts: Include Firebase SDK scripts for Firebase and FCM in your frontend HTML.

   ```html
   <script src="https://www.gstatic.com/firebasejs/9.0.0/firebase-app.js"></script>
   <script src="https://www.gstatic.com/firebasejs/9.0.0/firebase-messaging.js"></script>
   ```

2. Initialize Firebase in JavaScript: Use the configuration details from Firebase Console.

   ```js
   const firebaseConfig = {
     apiKey: 'your-api-key',
     authDomain: 'your-project-id.firebaseapp.com',
     projectId: 'your-project-id',
     storageBucket: 'your-project-id.appspot.com',
     messagingSenderId: 'your-sender-id',
     appId: 'your-app-id'
   };

   // Initialize Firebase
   firebase.initializeApp(firebaseConfig);
   const messaging = firebase.messaging();
   ```

3. Request Notification Permission and Get Token: Prompt users for notification permission and retrieve their unique token, then send this token to your backend for storage.

   ```js
   messaging
     .requestPermission()
     .then(() => messaging.getToken())
     .then(token => {
       console.log('Token:', token);
       // Send the token to the server to save it in the database
       fetch('/save_token.php', {
         method: 'POST',
         headers: { 'Content-Type': 'application/json' },
         body: JSON.stringify({ token: token })
       });
     })
     .catch(err => console.log('Error getting token', err));
   ```

## Step 4: Save the Token in MySQL (PHP Backend)

Create a PHP script (save_token.php) to save the FCM token received from the frontend.

```php
<?php
// Database connection
$pdo = new PDO('mysql:host=localhost;dbname=your_database', 'username', 'password');

// Get token from POST request
$data = json_decode(file_get_contents('php://input'), true);
$token = $data['token'];
$user_id = 1; // Use the logged-in user's ID in a real app

// Insert or update token in the database
$sql = "INSERT INTO user_tokens (user_id, token) VALUES (:user_id, :token)
        ON DUPLICATE KEY UPDATE token = :token";
$stmt = $pdo->prepare($sql);
$stmt->execute(['user_id' => $user_id, 'token' => $token]);

echo "Token saved successfully";
?>
```

## Step 5: Sending Notifications 📩 from PHP

Create a PHP script (send_notification.php) to send notifications via FCM. This script retrieves tokens from the database and sends a message to FCM.

```php
<?php
// Firebase server key
$serverKey = 'your-firebase-server-key';

// Database connection
$pdo = new PDO('mysql:host=localhost;dbname=your_database', 'username', 'password');

// Get tokens from the database
$user_id = 1; // Specify target user ID
$stmt = $pdo->prepare("SELECT token FROM user_tokens WHERE user_id = :user_id");
$stmt->execute(['user_id' => $user_id]);
$tokens = $stmt->fetchAll(PDO::FETCH_COLUMN);

// Notification data
$title = 'New Message!';
$body = 'You have received a new message.';

// Prepare notification payload
$notification = [
    'title' => $title,
    'body' => $body,
    'icon' => 'icon.png',
    'click_action' => 'https://yourwebsite.com'
];

$data = [
    'registration_ids' => $tokens, // array of tokens
    'notification' => $notification,
];

// Set up curl to send request to FCM
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    'Authorization: key=' . $serverKey,
    'Content-Type: application/json'
]);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

$response = curl_exec($ch);
curl_close($ch);

echo $response;
?>
```

## Step 6: Display Notifications in the Frontend 🎊

Create a listener in the frontend JavaScript to handle incoming messages and display them as notifications.

```js
messaging.onMessage(payload => {
  console.log('Message received: ', payload);
  alert(`${payload.notification.title}: ${payload.notification.body}`);
});
```

## Testing the Notification System

1. Ensure users have accepted notifications and their tokens are saved in the database.
2. Run send_notification.php to test sending a push notification.
3. Check if the notification appears on the user’s device.

## 🍉 Summary

This guide illustrates how to implement push notifications using PHP, MySQL, and Firebase Cloud Messaging:

1. Set up Firebase to manage push notifications.
2. Store FCM tokens in your MySQL database.
3. Use PHP to send notifications to specific users.
4. Utilize JavaScript on the client side to request permissions, store tokens, and display notifications.

This setup can be adapted for various applications, including e-commerce alerts, social media updates, or critical application notifications.

**Ref:** [Mayur Koshti - Towards Dev](https://towardsdev.com/push-notifications-using-php-and-mysql-firebase-cloud-messaging-8a8a20a44454)

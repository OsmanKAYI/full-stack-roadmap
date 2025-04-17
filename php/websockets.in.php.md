# Understanding WebSockets in PHP

WebSockets provide a full-duplex communication channel over a single TCP connection, making them ideal for real-time applications such as chat apps, live notifications, and collaborative tools. This article discusses how to implement WebSockets in PHP.

## Why WebSockets?

Traditional HTTP operates on a request-response model, which is inefficient for real-time applications since clients must continuously poll the server for updates. In contrast, WebSockets establish a persistent connection, allowing data to flow in both directions without the overhead of multiple HTTP requests.

## Setting Up a WebSocket Server with Ratchet

To create a WebSocket server in PHP, we will use the `Ratchet` library, a popular choice for managing WebSocket connections. Here’s how to get started:

### Prerequisites

1. **PHP 7.0 or higher**
2. **Composer** — A dependency management tool for PHP

### Step 1: Installing Ratchet

Install Ratchet using Composer. If Composer is not installed, download it from [getcomposer.org](https://getcomposer.org/).

```bash
composer require cboden/ratchet
```

### Step 2: Creating a WebSocket Server

Create a new PHP file named `server.php` and add the following code:

```php
<?php
require 'vendor/autoload.php';

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

class Chat implements MessageComponentInterface {
    protected $clients;

    public function __construct() {
        $this->clients = new \SplObjectStorage;
    }

    public function onOpen(ConnectionInterface $conn) {
        // Store the new connection
        $this->clients->attach($conn);
        echo "New connection! ({$conn->resourceId})\n";
    }

    public function onMessage(ConnectionInterface $from, $msg) {
        $numRecv = count($this->clients) - 1;
        echo sprintf('Connection %d sending message "%s" to %d other connection%s' . "\n",
            $from->resourceId, $msg, $numRecv, $numRecv == 1 ? '' : 's');

        foreach ($this->clients as $client) {
            if ($from !== $client) {
                // Send the message to all clients except the sender
                $client->send($msg);
            }
        }
    }

    public function onClose(ConnectionInterface $conn) {
        // Remove the connection from the clients list
        $this->clients->detach($conn);
        echo "Connection {$conn->resourceId} has disconnected\n";
    }

    public function onError(ConnectionInterface $conn, \Exception $e) {
        echo "An error has occurred: {$e->getMessage()}\n";
        $conn->close();
    }
}

// Run the server
$server = Ratchet\App::factory(function () {
    $loop = React\EventLoop\Factory::create();
    $pusher = new Chat();

    // Listen for the 'Chat' application on port 8080
    $webSock = new React\Socket\Server('0.0.0.0:8080', $loop);
    $webServer = new Ratchet\Server\IoServer(
        new Ratchet\Http\HttpServer(
            new Ratchet\WebSocket\WsServer(
                $pusher
            )
        ),
        $webSock
    );

    $loop->run();
}, 8080, '0.0.0.0');

echo "WebSocket server running at ws://localhost:8080\n";
```

### Step 3: Running the WebSocket Server

Run your WebSocket server using the PHP CLI:

```bash
php server.php
```

This command starts the WebSocket server, listening for connections on `ws://localhost:8080`.

### Step 4: Creating a WebSocket Client

To interact with the WebSocket server, create an HTML file named `client.html` and add the following code:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>WebSocket Client</title>
  </head>
  <body>
    <h1>WebSocket Client</h1>
    <input type="text" id="message" placeholder="Type a message..." />
    <button onclick="sendMessage()">Send</button>
    <ul id="messages"></ul>

    <script>
      var conn = new WebSocket('ws://localhost:8080');
      conn.onopen = function (e) {
        console.log('Connection established!');
      };
      conn.onmessage = function (e) {
        var messages = document.getElementById('messages');
        var message = document.createElement('li');
        message.textContent = e.data;
        messages.appendChild(message);
      };
      function sendMessage() {
        var input = document.getElementById('message');
        var msg = input.value;
        conn.send(msg);
        input.value = '';
      }
    </script>
  </body>
</html>
```

### Step 5: Testing the WebSocket Connection

1. Open the `client.html` file in a web browser.
2. Open the developer console to view connection logs.
3. Type a message in the input field and click “Send”.

You should see the message appear in the list, and if you open multiple browser windows, messages should appear in all windows, demonstrating the real-time communication enabled by WebSockets.

## Secure WebSockets Connections

To secure your WebSocket connections in PHP, follow these steps:

- **Use** `wss://` **instead of** `ws://`: When establishing WebSocket connections, use the `wss://` protocol for encrypted communication.
- **Reverse Proxy with Nginx**: Set up a reverse proxy using Nginx to handle WebSocket connections and enable SSL.
- **Server-Side Security Checks**: Implement security checks on the server side to ensure session IDs are secure and clean up unused sessions.

**Ref:** [Dragan Rapić - Level Up Coding](https://levelup.gitconnected.com/understanding-websockets-in-php-426e4a19c6c7)

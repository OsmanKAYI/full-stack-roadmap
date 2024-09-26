# Telegram Message Bot API

Telegram is a messaging and chat application. Telegram lets you send and receive messages from your users. The Telegram Bot API lets you build applications that interact with Telegram bots and sends any message to any user at any time.

## 1. Create Bot

- Open Telegram
- In the search field, type `botfather` and click on the result
- In the chat with BotFather, type `/newbot` and press Enter
- Set the display name of our bot. Example: `Sample Bot` and press Enter
- End the user name of our bot with `bot` or `_bot`. Example: `Sample_bot`
  - If the name is already taken, you will be notified. We need to choose a new name.
- If the operation is successful, our bot's access token will be `6487774889:AAGEYxUoCMg39WVUZVwHfAumfBZj2Dxm27o-XIGTv2E` like.

## 2. Add Bot to a Group

- Open the group where you want to send a message,
- In the search field, type the name of the bot you added earlier (in our case: Sample_bot)
- Select the button next to the found bot and press the `Next` button on the top right
- Now you are ready! Your bot can send messages to this group!
- Note that a bot can only send messages to a group if it has been added as an administrator to that group.
- If the bot is removed from the group, it will no longer be able to send messages to that group.

## 3. Send Message with PHP

- Do not forget to change the Receiver Name and Bot Token (Token) in the code below!

```php
<?php

function TelegramSendMessage($TOKEN, $GROUPNAME, $MESSAGE)
{
  $curl = curl_init();

  curl_setopt_array($curl, [
    CURLOPT_URL => "https://api.telegram.org/bot{$TOKEN}/sendMessage",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => "",
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => "POST",
    CURLOPT_POSTFIELDS => json_encode([
      'text' => "{$MESSAGE}",
      'disable_web_page_preview' => false,
      'disable_notification' => false,
      'reply_to_message_id' => null,
      'chat_id' => "{$GROUPNAME}"
    ]),
    CURLOPT_HTTPHEADER => [
      "accept: application/json",
      "content-type: application/json"
    ],
  ]);

  $response = curl_exec($curl);
  $err = curl_error($curl);

  curl_close($curl);

  if ($err) {
    echo "cURL Error #:" . $err;
  } else {
    echo $response;
  }
}

$TOKEN = "6468124398:AAGEYxUoCMg39WVUZVwHfAumfBZj2Dxm27o";
$GROUPNAME = "@SAMPLEGROUPNAME";
$MESSAGE = "Hello World !";

TelegramSendMessage($TOKEN, $GROUPNAME, $MESSAGE);
?>
```

- This code will send a message "Hello World!" to your Telegram group when it is executed.

## EXTRA 1: If you want to send message to a person

- Allow the person to find your bot in the search and initiate the first interaction with a "hello" message.
- For the bot to send a message to you (yourself), you need to perform the same process.
- Bots can send messages to a person if, at least once, they have received a message from that person.

## EXTRA 2: If you want to send message from web browser

- `https://api.telegram.org/bot{$TOKEN}/sendMessage?chat_id=@{$GROUPNAME}&text={$MESSAGE}`

**Refs:**

- [sendMessage - Telegram](https://telegram-bot-sdk.readme.io/reference/sendmessage)
- [sendMessage API - Telegram](https://core.telegram.org/bots/api#sendmessage)
- [OsmanKAYI - GitHub](https://github.com/OsmanKAYI/php_mysql_notlari)

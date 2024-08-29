# Tracking Technologies: Even Cookies Seem Innocent Beside Them

Advertising and tracking technologies are often dubbed the dark side of the modern web world. Simply put, tracking technologies are snippets of code that allow companies to monitor your online activities and build detailed profiles about you. These profiles are shaped based on which websites you visit, what you click on, and much more.

Third-party tracking technologies can use the data they collect for purposes beyond the website's instructions. Therefore, the violation of the principle of purpose limitation and the spreading of digital footprints pose risks in terms of privacy and compliance.

Embedded third-party tracking technologies, used on many websites and applications, enable companies behind the technology to create massive profiles by combining your digital footprints.

## Browser

As all tracking activities occur when users access a web page through their browsers, I'll first touch on browsers. A web browser is a program that displays web pages and enables users to access them.

With HTML5, web pages can now store data within the browser itself. This advancement allows for much more data to be stored than was possible with just cookies, enabling more complex data processing activities.

## Local Storage

Web sites provide a storage area known as local storage, allowing specific values to be saved in the browser. It's primarily used for data intended to be stored for long periods.

Below is an example of code used to create a local storage object:

```js
var testObject = { 'one': 1, 'two': 2, 'three': 3 };

// Put the object into storage
localStorage.setItem('testObject', JSON.stringify(testObject));

// Retrieve the object from storage
var retrievedObject = localStorage.getItem('testObject');

console.log('retrievedObject: ', JSON.parse(retrievedObject));
```

Local storage continues to store data even after the browser is closed and the session ends. It's limited to approximately 5 MB of storage space and persists until the browser history is cleared or the user data is deleted.

## Session Storage

Session storage allows specific values to be stored in the browser for only one session, meaning the data is lost when the browser tab is closed. It's tab-specific and its lifespan depends on the session duration. It's useful for storing small amounts of session-specific information.

```js
if (sessionStorage.getItem("autosave")
 { field.value = sessionStorage.getItem("autosave"); }
field.addEventListener("change", function()
{sessionStorage.setItem("autosave", field.value);});
);
```

## IndexedDB

IndexedDB is another way to store data permanently in a user's browser. It can store data of up to approximately 2 GB and offers features such as data types, table logic, and indexing.

```js
// User releated data looks like this
const customerData = [
  { TCKN: "34364346335", name: "Osman", age: 25, email: "osmankayi06@gmail.com" },
  { TCKN: "34534534534", name: "Furkan", age: 22, email: "furkan@furkan.com" }
];
```

## Canvas Fingerprinting

Canvas, an HTML5 API used for drawing graphics and animations on web pages, is employed to identify and track users. This technique relies on the fact that the same graphics and animations are rendered differently on different computers. By combining various user device or browser characteristics, unique tokens can be generated to identify users across different sites.

When all these data points are combined, our digital footprints contain approximately three thousand different data points. When combined, these data points can violate users' privacy in a much more dangerous way compared to cookies or the methods mentioned above, often without their knowledge.

## Pixel

Pixels are HTML code snippets that enable a website to collect information about its visitors. Unlike cookies, they can work without being loaded into the user's browser. They can directly send acquired information to the web server, and it's not as easy for users to disable this tracking technology as it is with cookies.

Facebook Pixel poses a particular issue. Data collected from Facebook's pixel feature is not anonymous and can often be associated with individual users, usually by their names, leading to serious data breaches.

Below is an example tracking code for Facebook Pixel:

```html
<!-- Facebook Pixel Code -->

<script>

  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod? n.callMethod.apply(n,arguments):n.queue.push(arguments)};

  if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
  n.queue=[];t=b.createElement(e);t.async=!0;
  t.src=v;s=b.getElementsByTagName(e)[0];
  s.parentNode.insertBefore(t,s)}(window, document,'script', 'https://connect.facebook.net/en_US/fbevents.js');

  fbq('init', '{your-pixel-id-goes-here}');
  fbq('track', 'PageView');

</script>

<noscript>

  <img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id={your-pixel-id-goes-here}&ev=PageView&noscript=1"/>

</noscript>

<!-- End Facebook Pixel Code -->
```

## Email Tracking

Email tracking does not mean someone reads all of our personal emails. Today, almost all emails are sent and read in HTML. An HTML email can be thought of as a static web page with text formatting, custom fonts, and most importantly, embedded images. Therefore, the pixel technology mentioned above means that when you open an email, depending on your email client, your device may send a request to the pixel server.

Usually, they contain information about which email was opened and originally sent to which email address. However, the real risk here is that approximately 30% of emails leak this information to third-party tracking technologies. Moreover, approximately 80% of leaked data occurs over unreliable, unencrypted HTTP.

In conclusion, while cookies may seem benign compared to these tracking technologies, the reality is that our online activities are being monitored in more intricate ways than ever before.

**Ref:** [Mert Can Boyar - LinkedIn](https://www.linkedin.com/pulse/%C3%A7erezlerin-bile-yan%C4%B1nda-masum-kald%C4%B1%C4%9F%C4%B1-takip-mert-can-boyar/?originalSubdomain=tr)

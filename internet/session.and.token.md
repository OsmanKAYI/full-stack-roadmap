# Session and Token

## Session Start (Login)

- In computer security, logging in (or logging on, signing in, or signing on) is the process by which an individual gains access to a computer system by identifying and authenticating themselves.
- The user credentials are typically some form of username and a matching password, and these credentials themselves are sometimes referred to as a login (or logon, sign-in, sign-on).
- Once the user is logged in, the login token may be used to track what actions the user has taken while connected to the site.
- A login page may have a return URL parameter, which specifies where to redirect back after logging in or out. For example, it is `returnto=` on this site.
- A single user can open multiple sessions. Those sessions can occur on the same day, or over several days, weeks, or months.
- As soon as one session ends, there is then an opportunity to start a new session.
- There are two methods by which a session ends:
  - Time-based expiration:
    - After 30 minutes (by default) of inactivity
    - At midnight (determined by your timezone settings)
  - Campaign change:
    - If a user arrives via one campaign, leaves, and then comes back via a different campaign.
      - Analytics stores campaign source information. Each time the value of the campaign is updated, Analytics opens a new session.

**Ref:** <https://support.google.com/analytics/answer/2731565?hl=en#zippy=%2Cin-this-article>

## Session Management

- Session management in HTTP is achieved by maintaining a mapping of session IDs to session state information on the server and by sending a cookie containing the session ID to the client when the session is first established.
- Session management refers to the process of securely handling multiple requests to a web-based application or service from a single user or entity.
- Typically, a session is started when a user authenticates their identity using a password or another authentication protocol.
- Session management involves the sharing of secrets with authenticated users, and as such, secure cryptographic network communications are essential to maintaining session management security.
- Session tokens serve to identify a user’s session within the HTTP traffic being exchanged between the application and all of its users.
- HTTP traffic on its own is stateless, meaning each request is processed independently, even if they are related to the same session. Thus, session management is crucial for directing these web interactions and these tokens are vital as they’re passed back and forth between the user and the web application. Each request and response made will have an associated session token which allows the application to remember distinct information about the client using it.
- Session cookies were designed to help manage sessions, however, there are several properties of the cookie that must be configured and implemented correctly to prevent potential compromises.

**Ref:** <https://www.packetlabs.net/posts/session-management/>

## Session Security

- After logging in, a user establishes a session with the platform. Use session security to limit exposure to your network when a user leaves the computer unattended while still logged in.
- Session security also limits the risk of internal attacks, such as when one employee tries to use another employee’s session. Choose from several session settings to control session behavior.
- You can control when an inactive user session expires. The default session timeout is two hours of inactivity.
- When the session timeout is reached, users are prompted with a dialog that allows them to log out or continue working. If they don’t respond to this prompt, they’re logged out.

**Ref:** <https://help.salesforce.com/s/articleView?id=sf.security_overview_sessions.htm&type=5>

- HTTP is a stateless protocol, enabling the communication between a client (front-end) and a server (back-end). Sessions or tokens are used to overcome the stateless nature of HTTP requests.
- Types of authentication
  - Session based authentication
    - Session identifier (session ID) is created at server-side to uniquely identify each user login. This session ID is sent to the browser. The session ID is stored in a cookie in the client-side (browser). While the user is logged in, the cookie will be sent along with each subsequent request.
  - Token based authentication
    - Now, many web applications use JSON Web Token (JWT) instead of sessions for authentication. In a token based authentication, the server creates a JWT token with a secret and sends the JWT token to the client. The client stores the JWT token and includes JWT token in the header with every subsequent request. The server would then validate the JWT token with every request from the client and send a response.
- For more information visit [Beagle Security](https://beaglesecurity.com/blog/article/session-security.html).

## Session Token and Cookies

- The Access Manager Session Service creates a session data structure to store information about a user session and uses cookies to store a token that identifies the session data structure.
- When a user logs in and is successfully authenticated, the user is assigned a session, a session data structure that, minimally, stores the following information about a user session:

  - Maximum Idle Time: Maximum number of minutes without activity before the session will expire and the user must reauthenticate.
  - Maximum Session Time: Maximum number of minutes (activity or no activity) before the session expires and the user must reauthenticate.
  - Maximum Caching Time: Maximum number of minutes before the client contacts Access Manager to refresh cached session information.

- The Session Service also generates a session token for the new session data structure.
- The session token, also known as a sessionID, is an encrypted, unique string that identifies the specific session instance. If the session token is known to a protected resource such as an application, the application can access the session and all user information contained in it.
- In Access Manager, a session token is carried in a cookie.
- A cookie is an information packet generated by a web server and passed to a web browser. The fact that a web server generates a cookie for a user does not guarantee that the user is allowed access to protected resources. The cookie simply points to user information in a data store from which an access decision can be derived.

**NOTE:**Cookies are domain-specific. For example, a cookie generated by a web server within Domain A cannot be used by a web server in Domain B. Cookies can be passed only between servers in the same domain in which the cookie was set. Similarly, servers can set cookies only on servers within in their own domain.

**Ref:** <https://docs.oracle.com/cd/E19462-01/819-4669/adrbc/index.html>

#### What Are Computer Cookies?

- When you visit a website, your web server transfers a small packet of data to your device’s browser: a computer cookie. This cookie is designed to remember information about you, including a record of your website visits and activity.
- A computer cookie may also be referred to as:

  - HTTP cookie
  - Web cookie
  - Internet cookie
  - Browser cookie

#### How Do Cookies Work?

- Computer cookies are small files, often including unique identifiers, that web servers send to browsers. These cookies may be sent back to the server each time your browser requests a new page.
- The websites use cookies:

  - To tailor the website experience to you
  - To track your activity as you navigate the website
  - To recognize your computer
  - To enhance the website’s usability
  - To analyze your use of the website

- Computer cookies has three different flavors

  1. Persistent cookie

  - Stores data for an extended duration
  - Comes with an expiration date
  - Stores your username and password for easier login

  - When you log in to a site and ask it to “Remember You”, a persistent cookie stores your username and password, making it quicker for you to log in in the future.

  2. Session cookie

  - These are temporary cookies
  - Get deleted when you close your browser
  - Keeps items in your shopping cart even if you navigate to other pages

  - When you’re online shopping on a specific site, a session cookie keeps the items you’ve selected in your shopping cart, even if you click on different pages around the site.

  3. Third-party cookie

  - Known as tracking cookies
  - Collect data about your online behavior
  - Used by advertisers to display ads based on your previous online behavior

  - Imagine you look at a pair of shoes on a website, but don’t purchase them. Third-party cookies store your online viewing information, and pass that onto advertisers. The next day, you see an ad on your social media account for the exact pair of shoes you were looking for - it’s not magic, it’s third-party cookies.

- **Beware of the supercookie**

- A supercookie is a “super” type of tracking cookie that isn’t stored at the browser level, but rather at the network level.
  Supercookies can travel across browsers, and are permanent. The biggest risk of supercookies is that they can access information such as your browsing habits, login credentials, and image caches - even after you’ve deleted your cookies.

**Ref:** <https://www.hp.com/us-en/shop/tech-takes/what-are-computer-cookies>

## Refresh token

- Typically, a user needs a new access token when they attempt to access a resource for the first time or after the previous access token that was granted to them expires.
- For security purposes, access tokens may be valid for a short amount of time.
- Once they expire, client applications can use a refresh token to "refresh" the access token.
- That is, a refresh token is a credential artifact that lets a client application get new access tokens without having to ask the user to log in again which means refresh tokens are used to generate additional access tokens.
- This allows you to have short-lived access tokens without having to collect credentials every time one expires.
- You request a refresh token alongside the access and/or ID tokens as part of a user's initial authentication and authorization flow. Applications must then securely store refresh tokens since they allow users to remain authenticated.
- With persistent refresh token behavior, the same refresh token is returned each time the client makes a request to exchange a refresh token for a new access token until the refresh token lifetime expires.

#### Refresh Token Rotation for Token Security

- Public clients such as browser-based applications have a much higher risk of a refresh token being compromised when a persistent refresh token is used.
- With clients such as single-page applications (SPAs), long-lived refresh tokens aren't suitable, because there isn't a way to safely store a persistent refresh token in a browser and assure access by only the intended app. These threats are greatly reduced by rotating refresh tokens.
- Refresh token rotation helps a public client to securely rotate refresh tokens after each use.
- With refresh token rotation behavior, a new refresh token is returned each time the client makes a request to exchange a refresh token for a new access token.
- `Refresh token automatic reuse detection` can be very usefull against `malicious` users.
- For more information visit [okta Developer](https://developer.okta.com/docs/guides/refresh-tokens/main/) and [auth0 blog](https://auth0.com/blog/refresh-tokens-what-are-they-and-when-to-use-them/#What-Is-a-Refresh-Token).

## JWT (JSON Web Token)

- JSON Web Token is a proposed Internet standard for creating data with optional signature and/or optional encryption whose payload holds JSON that asserts some number of claims.
- The tokens are signed either using a private secret or a public/private key.
- In short, JWTs are used as a secure way to authenticate users and share information.
- **When should you use JSON Web Tokens?**
  - Authorization
  - Information Exchange
- **What is the JSON Web Token structure?**
  - In its compact form, JSON Web Tokens consist of three parts separated by dots (.), which are:
    - Header
    - Payload
    - Signature
- **How do JSON Web Tokens work?**

  - In authentication, when the user successfully logs in using their credentials, a JSON Web Token will be returned. Since tokens are credentials, great care must be taken to prevent security issues. In general, you should not keep tokens longer than required.
  - JWTs differ from other web tokens in that they contain a set of claims.
  - Claims are used to transmit information between two parties. What these claims are depends on the use case at hand. For example, a claim may assert who issued the token, how long it is valid for, or what permissions the client has been granted.
  - A JWT is a string made up of three parts, separated by dots (.), and serialized using base64.
  - In the most common serialization format, compact serialization, the JWT looks something like this: `xxxxx.yyyyy.zzzzz`.

  **Note that** If you send JWT tokens through HTTP headers, you should try to prevent them from getting too big. Some servers don't accept more than 8 KB in headers. If you are trying to embed too much information in a JWT token, like by including all the user's permissions, you may need an alternative solution, like Auth0 Fine-Grained Authorization.

- For more information visit [JWT](https://jwt.io/introduction) and [akana](https://jwt.io/introductionhttps://www.akana.com/blog/what-is-jwt).

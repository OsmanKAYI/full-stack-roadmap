# Laravel JWT (JSON Web Token) Installation and Usage Guide

## 1. Installation

### 1.1 Installing JWT Package

```bash
composer require php-open-source-saver/jwt-auth
```

### 1.2 Publishing Configuration File

```bash
php artisan vendor:publish --provider="PHPOpenSourceSaver\JWTAuth\Providers\LaravelServiceProvider"
```

### 1.3 Generating JWT Secret Key

```bash
php artisan jwt:secret
```

## 2. Model Configuration

### 2.1 User Model Update

Make the following changes in `app/Models/User.php`:

```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use PHPOpenSourceSaver\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
  /** @use HasFactory<\Database\Factories\UserFactory> */
  use HasFactory, Notifiable, SoftDeletes;

  /**
   * The attributes that are mass assignable.
   *
   * @var list<string>
   */

  public function getJWTIdentifier()
  {
    return $this->getKey();
  }

  public function getJWTCustomClaims()
  {
    return [];
  }

  protected $fillable = [
    'name',
    'email',
    'password',
    "user_level",
  ];

  /**
   * The attributes that should be hidden for serialization.
   *
   * @var list<string>
   */
  protected $hidden = [
    'password',
    'remember_token',
  ];

  /**
   * Get the attributes that should be cast.
   *
   * @return array<string, string>
   */
  protected function casts(): array
  {
    return [
      'email_verified_at' => 'datetime',
      'password' => 'hashed',
    ];
  }

  public function products()
  {
    return $this->hasMany(Product::class);
  }
}
```

## 3. Auth Configuration

### 3.1 config/auth.php Update

```php
<?php

return [

  /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    |
    | This option defines the default authentication "guard" and password
    | reset "broker" for your application. You may change these values
    | as required, but they're a perfect start for most applications.
    |
    */

  'defaults' => [
    'guard' => env('AUTH_GUARD', 'web'),
    'passwords' => env('AUTH_PASSWORD_BROKER', 'users'),
  ],

  /*
    |--------------------------------------------------------------------------
    | Authentication Guards
    |--------------------------------------------------------------------------
    |
    | Next, you may define every authentication guard for your application.
    | Of course, a great default configuration has been defined for you
    | which utilizes session storage plus the Eloquent user provider.
    |
    | All authentication guards have a user provider, which defines how the
    | users are actually retrieved out of your database or other storage
    | system used by the application. Typically, Eloquent is utilized.
    |
    | Supported: "session"
    |
    */

  'guards' => [
    'web' => [
      'driver' => 'session',
      'provider' => 'users',
    ],
    'api' => [
      'driver' => 'jwt',
      'provider' => 'users',
      'hash' => true,
    ],
  ],

  /*
    |--------------------------------------------------------------------------
    | User Providers
    |--------------------------------------------------------------------------
    |
    | All authentication guards have a user provider, which defines how the
    | users are actually retrieved out of your database or other storage
    | system used by the application. Typically, Eloquent is utilized.
    |
    | If you have multiple user tables or models you may configure multiple
    | providers to represent the model / table. These providers may then
    | be assigned to any extra authentication guards you have defined.
    |
    | Supported: "database", "eloquent"
    |
    */

  'providers' => [
    'users' => [
      'driver' => 'eloquent',
      'model' => env('AUTH_MODEL', App\Models\User::class),
    ],

    // 'users' => [
    //     'driver' => 'database',
    //     'table' => 'users',
    // ],
  ],

  /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    |
    | These configuration options specify the behavior of Laravel's password
    | reset functionality, including the table utilized for token storage
    | and the user provider that is invoked to actually retrieve users.
    |
    | The expiry time is the number of minutes that each reset token will be
    | considered valid. This security feature keeps tokens short-lived so
    | they have less time to be guessed. You may change this as needed.
    |
    | The throttle setting is the number of seconds a user must wait before
    | generating more password reset tokens. This prevents the user from
    | quickly generating a very large amount of password reset tokens.
    |
    */

  'passwords' => [
    'users' => [
      'provider' => 'users',
      'table' => env('AUTH_PASSWORD_RESET_TOKEN_TABLE', 'password_reset_tokens'),
      'expire' => 60,
      'throttle' => 60,
    ],
  ],

  /*
    |--------------------------------------------------------------------------
    | Password Confirmation Timeout
    |--------------------------------------------------------------------------
    |
    | Here you may define the amount of seconds before a password confirmation
    | window expires and users are asked to re-enter their password via the
    | confirmation screen. By default, the timeout lasts for three hours.
    |
    */

  'password_timeout' => env('AUTH_PASSWORD_TIMEOUT', 10800),

];
```

## 4. Creating Controller

### 4.1 Creating AuthController

```bash
php artisan make:controller Api/AuthController
```

### 4.2 AuthController Content

- Edit `app/Http/Controllers/Api/AuthController.php`:

```php
<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use PHPOpenSourceSaver\JWTAuth\Exceptions\TokenExpiredException;
use PHPOpenSourceSaver\JWTAuth\Exceptions\TokenInvalidException;
use PHPOpenSourceSaver\JWTAuth\Exceptions\JWTException;

class AuthController extends Controller
{
  public function __construct()
  {
    $this->middleware('auth:api', ['except' => ['login', 'register']]);
  }

  // Register
  public function register(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'name' => 'required|string|max:255',
      'email' => 'required|string|email|max:255|unique:users',
      'password' => [
        'required',
        'string',
        Password::min(8)
          ->max(32) // maximum length allowed
          ->letters() // must contain at least one letter
          ->mixedCase() // must contain at least one uppercase and one lowercase letter
          ->numbers() // must contain at least one number
        // ->symbols() // must contain at least one symbol
        // ->uncompromised() // check if the password has been leaked
      ],
    ]);

    if ($validator->fails()) {
      return response()->json([
        'success' => false,
        'message' => 'Validation failed',
        'errors' => $validator->errors()
      ], Response::HTTP_BAD_REQUEST);
    }

    $user = User::create([
      'name' => $request->name,
      'email' => $request->email,
      'password' => Hash::make($request->password),
    ]);

    $token = Auth::login($user);

    return response()->json([
      'status' => 'success',
      'message' => 'User created successfully',
      'user' => $user,
      'authorisation' => [
        'token' => $token,
        'type' => 'bearer',
      ]
    ], Response::HTTP_CREATED);
  }

  // Login
  public function login(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'email' => 'required|email',
      'password' => 'required|string|min:8',
    ]);

    if ($validator->fails()) {
      return response()->json($validator->errors(), Response::HTTP_UNPROCESSABLE_ENTITY);
    }

    $credentials = $request->only('email', 'password');

    $token = Auth::attempt($credentials);
    if (!$token) {
      return response()->json([
        'status' => 'error',
        'message' => 'Unauthorized',
      ], Response::HTTP_UNAUTHORIZED);
    }

    return response()->json([
      'status' => 'success',
      'user' => Auth::user(),
      'authorisation' => [
        'token' => $token,
        'type' => 'bearer',
      ]
    ], Response::HTTP_OK);
  }

  // Get the authenticated user
  public function profile()
  {
    return response()->json([
      'status' => 'success',
      'user' => Auth::user(),
    ], Response::HTTP_OK);
  }

  // Logout
  public function logout()
  {
    Auth::logout();
    return response()->json([
      'status' => 'success',
      'message' => 'Successfully logged out',
    ], Response::HTTP_OK);
  }

  // Refresh
  public function refresh()
  {
    try {
      $token = Auth::refresh();
    } catch (TokenExpiredException $e) {
      return response()->json(['error' => 'Token has expired'], Response::HTTP_UNAUTHORIZED);
    } catch (TokenInvalidException $e) {
      return response()->json(['error' => 'Token is invalid'], Response::HTTP_UNAUTHORIZED);
    } catch (JWTException $e) {
      return response()->json(['error' => 'Token is invalid'], Response::HTTP_UNAUTHORIZED);
    }

    return response()->json([
      'status' => 'success',
      'user' => Auth::user(),
      'authorisation' => [
        'token' => $token,
        'type' => 'bearer',
      ]
    ]);
  }
}
```

- Edit `app/Http/Controllers/Controller.php`:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

abstract class Controller extends BaseController
{
  use AuthorizesRequests, ValidatesRequests;
  //
}
```

## 5. Route Definitions

### 5.1 API Routes

In `routes/api.php`:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\Api\AuthController;
use Illuminate\Http\Response;


// JWT protected routes
Route::middleware('auth:api')->group(function () {
  // Authantication
  Route::controller(AuthController::class)->group(function () {
    Route::post('logout', 'logout')->name('auth.logout');
    Route::post('refresh', 'refresh')->name('auth.refresh');
    Route::get('profile', 'profile')->name('auth.profile');
  });

  // Products
  Route::apiResource('products', ProductController::class);
});

// not JWT protected routes
Route::controller(AuthController::class)->group(function () {
  Route::post('register', 'register')->name('register');
  Route::post('login', 'login')->name('login');
});

// Fallback route for 404 errors
Route::fallback(function () {
  return response()->json([
    'status' => 'error',
    'message' => 'Not Found',
  ], Response::HTTP_NOT_FOUND);
});
```

## 6. Accessing JWT Content

You can access the information stored in the JWT token when it's decoded:

```php
// Usage in Controller
$token = auth()->payload();
$name = $token->get('name');
$role = $token->get('role');

// or
$claims = $token->toArray();
```

## 7. Using API Endpoints

### 7.1 New User Registration

```bash
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Test User","email":"test@example.com","password":"password123"}'
```

### 7.2 User Login

```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test21@example.com","password":"Password123"}' \
  -H "Authorization: Bearer your_token"
```

### 7.3 Token Refresh

```bash
curl -X POST http://localhost:8000/api/refresh \
  -H "Authorization: Bearer your_token"
```

### 7.4 User Information

```bash
curl -X GET http://localhost:8000/api/user \
  -H "Authorization: Bearer your_token"
```

### 7.5 Logout

```bash
curl -X POST http://localhost:8000/api/logout \
  -H "Authorization: Bearer your_token"
```

## 8. Postman Collection Setup

### 8.1 Collection Setup

1. Open Postman and create a new collection named "Laravel JWT Auth"
2. Set up collection variables:
   - `base_url`: Your API base URL (e.g., `http://localhost:8000/api`)
   - `token`: This will store the JWT token automatically under `Authorization->Token`
     - Note that this token should be fulfilled after [login](#login-user) to make the following processes [Referesh Token](#73-token-refresh), [Get User](#74-user-information),and [Logout](#75-logout) to be working properly.

### 8.2 Environment Setup

Create a new environment (e.g., "Laravel Local"):

```json
{
  "base_url": "http://localhost:8000/api",
  "token": ""
}
```

### 8.3 Request Examples

#### Register User

```json
{
  "name": "POST",
  "url": "{{base_url}}/register",
  "body": {
    "mode": "raw",
    "raw": {
      "name": "Test User",
      "email": "test@example.com",
      "password": "Password123"
    },
    "options": {
      "raw": {
        "language": "json"
      }
    }
  },
  "header": [
    {
      "key": "Content-Type",
      "value": "application/json"
    },
    {
      "key": "Accept",
      "value": "application/json"
    }
  ]
}
```

#### Login User

```json
{
  "name": "POST",
  "url": "{{base_url}}/login",
  "body": {
    "mode": "raw",
    "raw": {
      "email": "test@example.com",
      "password": "Password123"
    },
    "options": {
      "raw": {
        "language": "json"
      }
    }
  },
  "header": [
    {
      "key": "Content-Type",
      "value": "application/json"
    },
    {
      "key": "Accept",
      "value": "application/json"
    }
  ]
}
```

#### Get User Profile

```json
{
  "name": "GET",
  "url": "{{base_url}}/profile",
  "header": [
    {
      "key": "Authorization",
      "value": "Bearer {{token}}"
    },
    {
      "key": "Accept",
      "value": "application/json"
    }
  ]
}
```

#### Refresh Token

```json
{
  "name": "POST",
  "url": "{{base_url}}/refresh",
  "header": [
    {
      "key": "Authorization",
      "value": "Bearer {{token}}"
    },
    {
      "key": "Accept",
      "value": "application/json"
    }
  ]
}
```

#### Logout User

```json
{
  "name": "POST",
  "url": "{{base_url}}/logout",
  "header": [
    {
      "key": "Authorization",
      "value": "Bearer {{token}}"
    },
    {
      "key": "Accept",
      "value": "application/json"
    }
  ]
}
```

### 8.4 Testing the Endpoints

1. First, send the Register request to create a new user
2. The token will be automatically saved to your environment
3. You can now use other endpoints that require authentication
4. To test token expiry, wait for the token to expire and try using an authenticated endpoint
5. Use the Refresh Token endpoint to get a new token
6. Finally, test the Logout endpoint to invalidate the token

## 9. JWT Configuration Options

There are several configuration options in the `config/jwt.php` file for the JWT package:

1. `ttl`: Token validity period (in minutes)
2. `refresh_ttl`: Refresh token validity period
3. `algo`: Token encryption algorithm
4. `required_claims`: Required token claims
5. `persistent_claims`: Persistent claims
6. `lock_subject`: Subject locking
7. `leeway`: Time tolerance
8. `blacklist_enabled`: Blacklist feature
9. `blacklist_grace_period`: Blacklist grace period

## 10. JWT vs Sanctum Comparison

### JWT Advantages

1. Stateless authentication (no session required)
2. Token refresh capability
3. Tokens are not stored on the server
4. More suitable for cross-domain usage
5. Tokens can carry custom claims

### Sanctum Advantages

1. Simpler setup and usage
2. Tokens are stored in database and can be revoked when needed
3. More suitable for SPAs
4. CSRF protection included
5. Token abilities can be defined

## 11. Security Measures

1. HTTPS is mandatory
2. Set appropriate token duration
3. Store refresh tokens securely
4. Actively use blacklist feature
5. Implement rate limiting
6. Transfer tokens securely
7. Add additional verification mechanisms for sensitive operations

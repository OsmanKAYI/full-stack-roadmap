# Building a REST API with Laravel 11: A Complete Guide

This comprehensive guide walks through creating a RESTful API using Laravel 11, from initial setup to testing.

## TLDR

All you need to know to build a REST API using Laravel 11.

- Create a new Laravel project.
- Create a Product model and migration.
- Create an API controller.
- Implement API endpoints (routes & providers).
- Test the API with Postman.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Setup](#project-setup)
- [Creating the API](#creating-the-api)
- [Testing with Postman](#testing-with-postman)
- [Advanced Concepts](#advanced-concepts)
- [Running the Application](#running-the-application)
- [Best Practices](#best-practices)
- [Common Issues and Solutions](#common-issues-and-solutions)
- [Next Steps](#next-steps)
- [Additional Resources](#additional-resources)

## Prerequisites

- PHP 8.2 or higher
- Composer
- SQLite or any other database
- Postman for testing

## Project Setup

### 1. Create New Laravel Project

```bash
composer create-project laravel/laravel test-api-jwt
cd test-api-jwt
```

### 2. Configure Environment

```bash
cp .env.example .env
php artisan key:generate
#this will generate a random encryption key for your application.
```

#### WAY 1: Update `.env` file for SQLite

```env
DB_CONNECTION=sqlite
```

Create SQLite database:

```bash
touch database/database.sqlite
```

#### WAY 2: Update `.env` file for MySQL

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=test_api_jwt
DB_USERNAME=root
DB_PASSWORD=
# Set your MySQL password above
```

## Creating the API

### 1. Edit `app/Models/User.php` Model

```php
<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
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

### 2. Edit `database/migrations/0001_01_01_000000_create_users_table.php` Migration

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->integer('user_level')->default(1);
            $table->softDeletes();
            $table->timestamps();
        });

        Schema::create('password_reset_tokens', function (Blueprint $table) {
            $table->string('email')->primary();
            $table->string('token');
            $table->timestamp('created_at')->nullable();
        });

        Schema::create('sessions', function (Blueprint $table) {
            $table->string('id')->primary();
            $table->foreignId('user_id')->nullable()->index();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->longText('payload');
            $table->integer('last_activity')->index();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
        Schema::dropIfExists('password_reset_tokens');
        Schema::dropIfExists('sessions');
    }
};
```

### 3. Edit `database/factories/UserFactory.php` Factory

```php
<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
  /**
   * The current password being used by the factory.
   */
  protected static ?string $password;

  /**
   * Define the model's default state.
   *
   * @return array<string, mixed>
   */
  public function definition(): array
  {
    return [
      'name' => fake()->name(),
      'email' => fake()->unique()->safeEmail(),
      'email_verified_at' => now(),
      'password' => static::$password ??= Hash::make('password'),
      'remember_token' => Str::random(10),
      'user_level' => fake()->numberBetween(1, 3),
    ];
  }

  /**
   * Indicate that the model's email address should be unverified.
   */
  public function unverified(): static
  {
    return $this->state(fn(array $attributes) => [
      'email_verified_at' => null,
    ]);
  }
}
```

### 4. Create Database Seeders

```bash
php artisan make:seeder SuperAdminSeeder
php artisan make:seeder UserSeeder
```

- Edit `database/seeders/SuperAdminSeeder.php`:

```php
<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class SuperAdminSeeder extends Seeder
{
    public function run(): void
    {
        User::factory()->create([
            'name' => 'Super Admin',
            'email' => 'sa@example.com',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'user_level' => 0
        ]);
    }
};
```

- Edit `database/seeders/UserSeeder.php`:

```php
<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
  public function run(): void
  {
    User::factory()->count(15)->create();
  }
};
```

### 5. Create Product Model, Migration, Factory, Seeder, and Controller

```bash
php artisan make:model Product -mfsc --api
# -m for migration
# -f for factory
# -s for seeder
# -c for controller
# --api for API resources on controller
```

This creates:

- `app/Models/Product.php`
- `database/migrations/[timestamp]_create_products_table.php`
- `database/factories/ProductFactory.php`
- `database/seeders/ProductSeeder.php`
- `app/Http/Controllers/ProductController.php`

### 6. Edit Product Model, Migration, Factory, Seeder, and Controller

- Edit `app/Models/Product.php`:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'name',
        'price',
        'description',
        'stock'
    ];

    public function user()
    {
      return $this->belongsTo(User::class);
    }
};
```

- Edit the migration file `database/migrations/[timestamp]_create_products_table.php`:

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained();
            $table->string('name');
            $table->text('description');
            $table->decimal('price', 10, 2);
            $table->integer('stock');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
```

- Edit `database/factories/ProductFactory.php`:

```php
<?php

namespace Database\Factories;

use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
  /**
   * Define the model's default state.
   *
   * @return array<string, mixed>
   */
  public function definition(): array
  {
    return [
      'user_id' => User::inRandomOrder()->first()->id,
      'name' => fake()->unique()->words(3, true),
      'description' => fake()->paragraph(),
      'price' => fake()->randomFloat(2, 10, 1000),
      'stock' => fake()->numberBetween(0, 100),
      'created_at' => fake()->dateTimeBetween('-1 year'),
      'updated_at' => fake()->dateTimeBetween('-6 months'),
    ];
  }
}
```

- Edit `database/seeders/ProductSeeder.php`:

```php
<?php

namespace Database\Seeders;

use App\Models\Product;
use Faker\Factory;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        // Create 100 products using the factory
        Product::factory()->count(100)->create();
    }
};
```

- Edit `app/Http/Controllers/ProductController.php`:

```php
<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
  // GetAllData
  public function index()
  {
    return response()->json([
      'success' => true,
      'data' => Product::all()
      // 'data' => Product::orderBy('created_at', 'desc')->limit(10)->get()  // Get the last 10 products
      // 'data' => Product::with('user:id,name,user_level')->limit(10)->get(['id', 'name', 'user_id'])  // Get the last 10 products with user
    ], Response::HTTP_OK);
  }

  //InsertData
  public function store(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'user_id' => 'required|integer|exists:users,id',
      'name' => 'required|string|max:255',
      'description' => 'required|string',
      'price' => 'required|numeric|min:0',
      'stock' => 'required|integer|min:0'
    ]);

    if ($validator->fails()) {
      return response()->json([
        'success' => false,
        'message' => 'Validation failed',
        'errors' => $validator->errors()
      ], Response::HTTP_BAD_REQUEST);
    }

    $product = Product::create($validator->validated());

    return response()->json([
      'success' => true,
      'data' => $product
    ], Response::HTTP_CREATED);
  }

  //GetSingleData
  public function show(Product $product)
  {
    return response()->json([
      'success' => true,
      'data' => $product
    ], Response::HTTP_OK);
  }

  //UpdateData
  public function update(Request $request, Product $product)
  {
    $validator = Validator::make($request->all(), [
      'user_id' => 'sometimes|integer|exists:users,id',
      'name' => 'sometimes|string|max:255',
      'description' => 'sometimes|string',
      'price' => 'sometimes|numeric|min:0',
      'stock' => 'sometimes|integer|min:0'
    ]);

    if ($validator->fails()) {
      return response()->json([
        'success' => false,
        'message' => 'Validation failed',
        'errors' => $validator->errors()
      ], Response::HTTP_BAD_REQUEST);
    }

    $product->update($validator->validated());

    return response()->json([
      'success' => true,
      'data' => $product
    ], Response::HTTP_OK);
  }

  //DeleteData
  public function destroy(Product $product)
  {
    $product->delete();

    return response()->json([
      'success' => true,
      'message' => 'Product deleted successfully'
    ], Response::HTTP_NO_CONTENT);
  }
};
```

### 7. Database Seeder

- Edit `database/seeders/DatabaseSeeder.php`:

```php
<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
  /**
   * Seed the application's database.
   */
  public function run(): void
  {
    $this->call([
      SuperAdminSeeder::class,
      UserSeeder::class,
      ProductSeeder::class
    ]);
  }
}
```

### 8. Run Migrations and Seeders

```bash
php artisan migrate:fresh --seed
```

**NOTE:** To run specific seeder: `php artisan db:seed ProductSeeder` or `php artisan db:seed --class=ProductSeeder`

### 9. Configure Route Provider

```bash
php artisan make:provider RouteServiceProvider
```

**NOTE:** This will create `app/Providers/RouteServiceProvider.php` and also add `App\Providers\RouteServiceProvider::class` line to `bootstrap/providers.php`.

- Edit `app/Providers/RouteServiceProvider.php`:

```php
<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
  public function boot(): void
  {
    RateLimiter::for('api', function (Request $request) {
      return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
    });

    $this->routes(function () {
      Route::middleware('api')
        ->prefix('api')
        ->group(base_path('routes/api.php'));

      Route::middleware('web')
        ->group(base_path('routes/web.php'));
    });
  }
}
```

### 10. Create API Routes

```bash
touch routes/api.php
```

- Edit `routes/api.php`:

```php
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

Route::apiResource('products', ProductController::class);
```

## Testing with Postman

### Available Endpoints

| Method    | Endpoint             | Description        |
| --------- | -------------------- | ------------------ |
| GET       | `/api/products`      | List all products  |
| GET       | `/api/products/{id}` | Get single product |
| POST      | `/api/products`      | Create new product |
| PUT/PATCH | `/api/products/{id}` | Update product     |
| DELETE    | `/api/products/{id}` | Delete product     |

### Example Requests

#### Create Product (POST)

```http
POST /api/products
Content-Type: application/json

{
    "name": "Test Product",
    "description": "Test product description",
    "price": 149.99,
    "stock": 25
}
```

**Response Status Codes:**

- `201 Created`: Product successfully created
- `400 Bad Request`: Validation failed

#### Update Product (PUT)

```http
PUT /api/products/1
Content-Type: application/json

{
    "name": "Updated Product",
    "price": 199.99
}
```

**Response Status Codes:**

- `200 OK`: Product successfully updated
- `400 Bad Request`: Validation failed
- `404 Not Found`: Product not found

### Response Format

```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Test Product",
    "description": "Test product description",
    "price": "149.99",
    "stock": 25,
    "created_at": "2025-01-09T13:41:01.000000Z",
    "updated_at": "2025-01-09T13:41:01.000000Z"
  }
}
```

**Error Response Format:**

```json
{
  "success": false,
  "message": "Validation failed",
  "errors": {
    "field": ["Error message"]
  }
}
```

## Advanced Concepts

### 1. Validation Rules

- **Create (POST)**

  - name: required, string, max:255
  - description: required, string
  - price: required, numeric, min:0
  - stock: required, integer, min:0

- **Update (PUT/PATCH)**
  - All fields are optional but follow same rules

### 2. Rate Limiting

- Default: 60 requests per minute per IP
- Configured in RouteServiceProvider

### 3. Error Handling

- Validation errors return 422 status code
- Not found errors return 404 status code
- Server errors return 500 status code

## Running the Application

1. Start development server:

   ```bash
   php artisan serve
   ```

2. Clear various caches if needed:

   ```bash
   php artisan optimize:clear    # Clear all caches
   php artisan config:clear     # Clear config cache
   php artisan route:clear      # Clear route cache
   php artisan cache:clear      # Clear application cache
   ```

3. View all routes:

   ```bash
   php artisan route:list
   ```

## Best Practices

1. **Response Format Consistency**

   - Always use consistent JSON structure
   - Include success status in response
   - Use appropriate HTTP status codes

2. **Validation**

   - Always validate input data
   - Use Laravel's built-in validation
   - Return clear validation error messages

3. **Route Naming**

   - Use resource routes when possible
   - Follow REST conventions
   - Use appropriate HTTP methods

4. **Security**
   - Implement rate limiting
   - Validate all input
   - Use HTTPS in production

## Common Issues and Solutions

1. **Routes Not Working**

   - Check RouteServiceProvider configuration
   - Clear route cache
   - Ensure API prefix is correct

2. **Validation Errors**

   - Check request data format
   - Verify validation rules
   - Check error messages in response

3. **Database Issues**
   - Verify database configuration
   - Run migrations
   - Run seeder when needed
   - Check file permissions for SQLite

## Next Steps

1. Adding relationships between models
2. Implement caching
3. Implement JWT authentication
4. Add authentication ([Laravel Sanctum](https://laravel.com/docs/11.x/sanctum))
5. Social Authentication with [Laravel Socialite](https://laravel.com/docs/11.x/socialite)
6. WebSocket with [Laravel Echo](https://laravel.com/docs/11.x/broadcasting)
7. Add API documentation (e.g., Swagger)
8. Add more complex validation
9. Implement API versioning

## Additional Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Laravel API Tutorial](https://laravel.com/docs/11.x/eloquent-resources)
- [REST API Best Practices](https://restfulapi.net/)
- [Postman Learning Center](https://learning.postman.com/)

## Suppress All Errors and Return JSON

- Create `App\Exceptions\Handler.php` file:

```bash
mkdir app/Exceptions
touch app/Exceptions/Handler.php
```

- Edit `app/Exceptions/Handler.php`:

```php
<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class Handler extends ExceptionHandler
{
  public function register(): void
  {
    $this->renderable(function (Throwable $e) {
      return new JsonResponse([
        'success' => false,
        'message' => $e->getMessage(),
        'code' => $e->getCode() ?: Response::HTTP_INTERNAL_SERVER_ERROR
      ], Response::HTTP_INTERNAL_SERVER_ERROR);
    });
  }
}
```

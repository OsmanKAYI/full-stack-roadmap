# Building a REST API with Laravel 11: A Complete Guide

This comprehensive guide walks through creating a RESTful API using Laravel 11, from initial setup to testing.

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
composer create-project laravel/laravel test-api
cd test-api
```

### 2. Configure Environment

```bash
cp .env.example .env
php artisan key:generate
#this will generate a random encryption key for your application.
```

Update `.env` file for SQLite:

```env
DB_CONNECTION=sqlite
```

Create SQLite database:

```bash
touch database/database.sqlite
```

## Creating the API

### 1. Create Product Model with Migration

```bash
php artisan make:model Product -m
```

This creates:

- `app/Models/Product.php`
- `database/migrations/[timestamp]_create_products_table.php`

### 2. Define Migration Schema

Edit the migration file:

```php
public function up(): void
{
    Schema::create('products', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->text('description');
        $table->decimal('price', 10, 2);
        $table->integer('stock');
        $table->timestamps();
    });
}
```

### 3. Configure Product Model

Edit `app/Models/Product.php`:

```php
class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'price',
        'stock'
    ];
}
```

### 4. Create API Controller

```bash
php artisan make:controller Api/ProductController --api
```

### 5. Implement Controller Methods

Edit `app/Http/Controllers/Api/ProductController.php`:

```php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function index()
    {
        return response()->json([
            'success' => true,
            'data' => Product::all()
        ], Response::HTTP_OK);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
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

    public function show(Product $product)
    {
        return response()->json([
            'success' => true,
            'data' => $product
        ], Response::HTTP_OK);
    }

    public function update(Request $request, Product $product)
    {
        $validator = Validator::make($request->all(), [
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

    public function destroy(Product $product)
    {
        $product->delete();

        return response()->json([
            'success' => true,
            'message' => 'Product deleted successfully'
        ], Response::HTTP_NO_CONTENT);
    }
}
```

### 6. Create API Routes

Edit `routes/api.php`:

```php
use App\Http\Controllers\Api\ProductController;
use Illuminate\Support\Facades\Route;

Route::apiResource('products', ProductController::class);
```

### 7. Create Database Seeder

```bash
php artisan make:seeder ProductSeeder
```

Edit `database/seeders/ProductSeeder.php`:

```php
namespace Database\Seeders;

use App\Models\Product;
use Faker\Factory;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Factory::create();

        for ($i = 0; $i < 100; $i++) {
            Product::create([
                'name' => $faker->unique()->word(3),
                'description' => $faker->paragraph(1),
                'price' => $faker->numberBetween(2, 100, 1000),
                'stock' => $faker->numberBetween(0, 1000)
            ]);
        }
    }
}
```

### 8. Register Seeder

Edit `database/seeders/DatabaseSeeder.php`:

```php
public function run(): void
{
    $this->call([
        ProductSeeder::class
    ]);
}
```

### 9. Run Migrations and Seeders

```bash
php artisan migrate:rollback
php artisan migrate:fresh --seed
```

### 10. Configure Route Provider

```bash
php artisan make:provider RouteServiceProvider
```

**NOTE:** This will create `app/Providers/RouteServiceProvider.php` and also add `App\Providers\RouteServiceProvider::class` line to `bootstrap/providers.php`.

Edit `app/Providers/RouteServiceProvider.php`:

```php
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

## Testing with Postman

### Available Endpoints

| Method    | Endpoint             | Description        |
| --------- | -------------------- | ------------------ |
| GET       | `/api/products`      | List all products  |
| POST      | `/api/products`      | Create new product |
| GET       | `/api/products/{id}` | Get single product |
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
2. Implement JWT authentication
3. Add authentication (Laravel Sanctum)
4. Google Authentication
5. Implement caching
6. Add API documentation (e.g., Swagger)
7. Add more complex validation
8. Implement API versioning

## Additional Resources

- [Laravel Documentation](https://laravel.com/docs)
- [Laravel API Tutorial](https://laravel.com/docs/11.x/eloquent-resources)
- [REST API Best Practices](https://restfulapi.net/)
- [Postman Learning Center](https://learning.postman.com/)

# Understanding and Applying Real-World OOP Principles in Laravel Framework

Object-oriented programming (OOP) examples like "book," "animal," or "car" can feel overly simplistic for backend development. This guide focuses on **practical OOP principles** within the Laravel framework.

---

## 1. Core OOP Principles

### Encapsulation

Keep data and methods private for better control and fewer bugs.

- **Example:** Use models to encapsulate business logic for database interactions.

### Inheritance

Share common behaviors among related classes.

- **Example:** Extend a base `Notification` class to create specific notifications.

### Polymorphism

Write code that works with objects of multiple types.

- **Example:** Use interfaces for dependency injection, like `PaymentGatewayInterface`.

### Abstraction

Define essential behaviors while hiding implementation details.

- **Example:** Use abstract controllers for shared CRUD operations.

## 2. Real-World OOP in Laravel

### a. Encapsulation with Models

Encapsulate business logic in models:

```php
class Order extends Model {
    public function calculateTotal() {
        return $this->items->sum(fn($item) => $item->price * $item->quantity);
    }

    public function markAsPaid() {
        $this->update(['status' => 'paid']);
    }
}
```

### b. Inheritance with Base Classes

Create a base controller for shared logic:

```php
class BaseController extends Controller {
    protected function jsonResponse($data, $message = 'Success', $status = 200) {
        return response()->json([
            'message' => $message,
            'data' => $data,
        ], $status);
    }
}

class ProductController extends BaseController {
    public function show($id) {
        $product = Product::findOrFail($id);
        return $this->jsonResponse($product, 'Product retrieved');
    }
}
```

### c. Polymorphism with Interfaces

Design systems that handle multiple implementations:

- **Interface and Implementations**

```php
interface PaymentGateway {
    public function charge($amount);
}

class StripePayment implements PaymentGateway {
    public function charge($amount) {
        // Stripe-specific logic
    }
}

class PayPalPayment implements PaymentGateway {
    public function charge($amount) {
        // PayPal-specific logic
    }
}
```

- **Dependency Injection**

```php
class PaymentService {
    protected $gateway;

    public function __construct(PaymentGateway $gateway) {
        $this->gateway = $gateway;
    }

    public function processPayment($amount) {
        return $this->gateway->charge($amount);
    }
}
```

### d. Abstraction with Repositories

Separate data access logic from controllers:

```php
interface ProductRepository {
    public function find($id);
}

class EloquentProductRepository implements ProductRepository {
    public function find($id) {
        return Product::findOrFail($id);
    }
}

class ProductController extends Controller {
    protected $repository;

    public function __construct(ProductRepository $repository) {
        $this->repository = $repository;
    }

    public function show($id) {
        $product = $this->repository->find($id);
        return response()->json($product);
    }
}
```

---

By applying these principles, your Laravel (or any other Language) codebase can become more maintainable, reusable, and aligned with real-world backend development.

**Ref:** [Mohasin Hossain - Medium](https://mohasin-dev.medium.com/understanding-and-applying-real-world-oop-principles-in-laravel-framework-a-practical-guide-7ba52a76836a)

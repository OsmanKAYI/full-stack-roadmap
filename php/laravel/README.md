# LARAVEL 11

Laravel is a free, open-source PHP web framework designed for building web applications following the model–view–controller (MVC) architectural pattern. It emphasizes elegant syntax, modern tooling, and developer productivity.

## Getting Started

1. Prerequisites

   - PHP >= 8.3
   - Composer
   - Node.js & NPM
   - Database (MySQL, PostgreSQL, SQLite)

2. Installation

   ```bash
   composer create-project laravel/laravel example-app
   cd example-app
   php artisan serve
   ```

3. Key Commands

   ```bash
   # Database
   php artisan migrate
   php artisan db:seed

   # Development
   php artisan make:controller
   php artisan make:model
   php artisan make:migration

   # Maintenance
   php artisan cache:clear
   php artisan config:clear
   php artisan route:cache
   ```

## Documentation

- [Comprehensive Laravel Development Guide](./laravel.cheatsheet.md)
- [Understanding and Applying Real-World OOP Principles in Laravel Framework](./oop.principles.md)
- [Difference Between `self::` and `$this`](./self.this.md)
- [Http Status Codes](./http.status.codes.md)
- [Building a REST API with Laravel 11: A Complete Guide](./building.rest.api.with.laravel11.md)
  - [Laravel JWT (JSON Web Token) Installation and Usage Guide](./laravel.jwt.setup.md)

## Resources

- [Official Documentation](https://laravel.com/docs)
- [Laracasts](https://laracasts.com/)
- [Laravel News](https://laravel-news.com/)

## Useful Tools

- [Laravel Forge](https://forge.laravel.com/): Server Management
  - [Laravel Vapor](https://vapor.laravel.com/): Serverless Deployment
  - [Laravel Nova](https://nova.laravel.com/): Admin Panel
- [Laravel Horizon](https://laravel.com/docs/horizon): Queue Monitoring
  - [Laravel Telescope](https://laravel.com/docs/telescope): Debugging
  - [Laravel Sanctum](https://laravel.com/docs/sanctum): API Authentication

## Community and Support

- [Laravel Forums](https://laracasts.com/discuss)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/laravel)
- [GitHub Issues](https://github.com/laravel/framework/issues)
- [Discord Community](https://discord.gg/laravel)

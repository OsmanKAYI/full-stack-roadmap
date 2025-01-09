# Comprehensive Laravel Development Guide

## Table of Contents

1. [Initial Setup](#initial-setup)
2. [Project Creation](#project-creation)
3. [Development Environment](#development-environment)
4. [Database Operations](#database-operations)
5. [Component Generation](#component-generation)
6. [Localization](#localization)
7. [Model and Resource Generation](#model-and-resource-generation)
8. [Mail Configuration](#mail-configuration)
9. [Event Handling](#event-handling)
10. [Best Practices](#best-practices)
11. [Common Issues and Solutions](#common-issues-and-solutions)

## Initial Setup

### Environment Configuration

```bash
# Add Composer's vendor bin directory to PATH

export PATH=$PATH:$HOME/.config/composer/vendor/bin

```

### System Requirements

- PHP 8.3 or higher

- Required PHP Extensions:

```bash
sudo apt install php8.3-bcmath -y

```

## Project Creation

There are two methods to create a new Laravel project:

### Method 1: Direct Creation

```bash
composer create-project laravel/laravel first-app

```

### Method 2: Using Laravel Installer

```bash
# Install Laravel installer globally

composer global require laravel/installer

# Create new project

laravel new second-app

```

## Development Environment

### Project Setup

```bash
cd first-app
composer install && npm install

```

### Starting Development Server

```bash
# Standard development server

php artisan serve

# Custom host and port

php artisan serve --host=192.168.85.138 --port=8000

# Development with Vite

composer run dev

```

## Database Operations

### Migration Commands

```bash
# Create new migration

php artisan make:migration create_users_table

# Run migrations

php artisan migrate

# Reset Database

php artisan db:wipe          # Drop all tables
php artisan migrate:fresh    # Drop all tables and re-run migrations
php artisan migrate:rollback # Rollback last migration

```

### Default Migrations

Laravel automatically creates:

- users_table

- cache_table

- jobs_table

## Component Generation

### Provider Generation

```bash
# Generate a new service provider
php artisan make:provider RouteServiceProvider
```

### View Components

```bash
php artisan make:component layout --view

```

## Localization

### Language Setup

```bash
# Install language package

composer require laravel-lang/common --dev

# Add new language (e.g., Turkish)

php artisan lang:add tr

```

## Model and Resource Generation

### Full Resource Generation

```bash
# Generate model with all resources (-a flag)

php artisan make:model Post -a
# This creates:

# - Model
# - Factory

# - Migration
# - Seeder

# - Controller
# - Policy

```

## Route Management

```bash
# View all registered routes

php artisan route:list

# Create storage symbolic link

php artisan storage:link

```

## Mail Configuration

```bash
# Generate mail class

php artisan make:mail WelcomeMail

```

### Timezone Configuration

```bash
# Set timezone in .env

APP_TIMEZONE=Europe/Istanbul

# Clear configuration cache

php artisan config:clear
php artisan optimize:clear

```

## Event Handling

### Event and Listener Setup

```bash
# Create event

php artisan make:event UserSubscribed

# Create listeners

php artisan make:listener SendSubscriberEmail
php artisan make:listener UpdateSubscribersTable

# Create subscriber table

php artisan make:migration create_subscribers_table
php artisan migrate

```

### Controller Generation

```bash
# Create new controller

php artisan make:controller ResetPasswordController

```

## Best Practices

1. Always run `php artisan optimize:clear` after changing configuration files
2. Use migration system for all database changes
3. Implement proper event handling for decoupled architecture
4. Keep controllers thin and models fat
5. Use artisan commands for generating boilerplate code
6. Implement proper localization from the start
7. Always secure your routes and controllers with proper middleware

### Cache Management

```bash
# Clear route cache
php artisan route:clear

# Clear application cache
php artisan cache:clear

# Clear config cache
php artisan config:clear
```

## Common Issues and Solutions

1. If composer commands fail, try:
   - Clearing composer cache
   - Updating composer
   - Checking PHP version compatibility
2. If migrations fail:
   - Check database credentials
   - Ensure proper database permissions
   - Verify migration syntax
3. For permission issues:
   - Check storage folder permissions
   - Verify bootstrap/cache permissions
   - Ensure proper .env configuration

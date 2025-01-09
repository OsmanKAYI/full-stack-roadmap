# Difference Between Self and This

The difference between self and this is that self refers to the object itself, while this refers to the current object in the method.

```php
<?php
  class SelfThisExample
  {
      // Static property - accessed with self::
      private static $counter = 0;

      // Instance property - accessed with $this
      private $name;

      public function __construct($name)
      {
          $this->name = $name;  // $this usage - instance property access
          self::$counter++;     // self usage - static property access
      }

      public function getName()
      {
          return $this->name;   // $this usage - instance property access
      }

      public static function getCounter()
      {
          return self::$counter;  // self usage - static property access
      }

      public function getMaxAttempts()
      {
          return self::MAX_ATTEMPTS;  // self usage - constant access
      }
  }

  // Usage example:
  $example1 = new SelfThisExample("Example 1");
  $example2 = new SelfThisExample("Example 2");

  // $this usage - instance method call
  echo $example1->getName();  // "Example 1"
  echo $example2->getName();  // "Example 2"

  // self usage - static method call
  echo SelfThisExample::getCounter();  // 2
  echo SelfThisExample::MAX_ATTEMPTS;  // 3
```

# Http Status Codes

Http status codes are used to indicate the success or failure of a HTTP request. The codes are defined in the HTTP specification.

```php
<?php
  class ApiStatusCodes
  {
      // Success Responses
      const OK = 200;                    // General success, GET, UPDATE
      const CREATED = 201;               // Resource created successfully (POST)
      const ACCEPTED = 202;              // Request accepted but not completed
      const NO_CONTENT = 204;            // Success but no content to return (DELETE)

      // Client Error Responses
      const BAD_REQUEST = 400;           // Invalid request format/syntax
      const UNAUTHORIZED = 401;          // Authentication required
      const FORBIDDEN = 403;             // No permission to access
      const NOT_FOUND = 404;             // Resource not found
      const METHOD_NOT_ALLOWED = 405;    // HTTP method not allowed
      const CONFLICT = 409;              // Request conflicts with current state
      const UNPROCESSABLE_ENTITY = 422;  // Validation failed

      // Server Error Responses
      const INTERNAL_SERVER_ERROR = 500; // Generic server error (ie, database transaction error)
      const NOT_IMPLEMENTED = 501;       // Functionality not implemented
      const SERVICE_UNAVAILABLE = 503;   // Server temporarily unavailable

      /**
       * Common CRUD Operations and their standard status codes
       */
      const CRUD_STATUS_CODES = [
          'CREATE' => [
              'success' => self::CREATED,        // 201: Resource created
              'error' => self::BAD_REQUEST       // 400: Invalid data
          ],
          'READ' => [
              'success' => self::OK,             // 200: Resource retrieved
              'error' => self::NOT_FOUND         // 404: Resource not found
          ],
          'UPDATE' => [
              'success' => self::OK,             // 200: Resource updated
              'error' => self::NOT_FOUND         // 404: Resource to update not found
          ],
          'DELETE' => [
              'success' => self::NO_CONTENT,     // 204: Resource deleted
              'error' => self::NOT_FOUND         // 404: Resource to delete not found
          ]
      ];
  }
```

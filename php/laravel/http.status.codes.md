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

Laravel provides a helper class to use the above codes.

```php
use Illuminate\Http\Response;

// You can use it like this
Response::HTTP_OK  // 200
Response::HTTP_CREATED // 201
Response::HTTP_BAD_REQUEST // 400
Response::HTTP_UNAUTHORIZED // 401
Response::HTTP_NOT_FOUND // 404
Response::HTTP_INTERNAL_SERVER_ERROR // 500

return response()->json([
    'status' => 'success',
    'message' => 'Test Api route'
], Response::HTTP_OK);
```

For CRUD requests, you can use the helper class `Response::HTTP_STATUS_CODES` to get the success and error codes for each operation.

```php
use Illuminate\Http\Response;

// For example, you can use it like this for all CRUD operations
public function index()
{
    return response()->json([
        'status' => 'success',
        'message' => 'Test Api route'
    ], Response::HTTP_OK);
}

public function store(Request $request)
{
    if ($request->isMethod('post')) {
        // Validate and store the blog post...
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to create blog post'
        ], Response::HTTP_UNPROCESSABLE_ENTITY);
    }

    return response()->json([
        'status' => 'success',
        'message' => 'Blog post created successfully'
    ], Response::HTTP_CREATED);
}

public function show($id)
{
    // Retrieve the blog post...

    return response()->json([
        'status' => 'success',
        'message' => 'Blog post retrieved successfully'
    ], Response::HTTP_OK);
}

public function update(Request $request, $id)
{
    if ($request->isMethod('put')) {
        // Validate and update the blog post...
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to update blog post'
        ], Response::HTTP_UNPROCESSABLE_ENTITY);
    }

    return response()->json([
        'status' => 'success',
        'message' => 'Blog post updated successfully'
    ], Response::HTTP_OK);
}

public function destroy($id)
{
    // Retrieve the blog post...

    // Delete the blog post...

    return response()->json([
        'status' => 'success',
        'message' => 'Blog post deleted successfully'
    ], Response::HTTP_NO_CONTENT);
}
```

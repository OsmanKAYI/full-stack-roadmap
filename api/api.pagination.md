# API Pagination Basics

Pagination divides large datasets into smaller, more manageable chunks, improving performance and user experience by preventing the loading of large amounts of data at once.

## Common Pagination Techniques

### Page-Based Pagination

- **Simple Implementation**
- **Allows jumping to specific pages**

**Steps:**

1. **Set Items per Page:** Decide on a fixed or configurable number of items per page.
2. **Calculate Start Index:** For page `N`, calculate start index as `(N - 1) * page_size`.
3. **Fetch Data:** Use `LIMIT` and `OFFSET` to retrieve data:

   ```sql
   SELECT * FROM table LIMIT 10 OFFSET 20;
   ```

### Cursor-Based Pagination

- **Efficient for Large, Dynamic Datasets**
- **Resilient to Changes (e.g., Deleted Records)**
- **Ideal for Infinite Scroll**

**Steps:**

1. **Choose Indexed Column:** Select an indexed column to use as the cursor.
2. **Hash Cursor Value:** Securely hash the cursor value.
3. **Client Request:** Client provides the hashed cursor value of the last item they saw.
4. **Server Filtering:** Server filters results based on the cursor and fetches the next page.
5. **Return New Cursor:** Server returns the hashed cursor value of the last item in the current page.
6. **Client Use:** Client uses the new cursor to request the next page.

![Pagination Diagram](https://pbs.twimg.com/media/GWC4hEuawAAt21H?format=png&name=small)

## Best Practices

- **Avoid OFFSET:** For large datasets, `OFFSET` becomes slower as the offset increases.
- **Use Indexed Columns for Cursor:** Efficiently handle large datasets by using cursors on indexed columns.

**Ref:** [sahnlam - X](https://x.com/sahnlam/status/1828664397465809350?t=d2SjxNLOaAEn0-y4EVVj4w&s=35)

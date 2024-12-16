# Basic Operators and Data Structures in Python

## Python For Loops

### Key Points

1. **Repeating a Process Using a For Loop**

   - A `for` loop iterates over each element of a list:

   ```python
   row_1 = ['Facebook', 0.0, 'USD', 2974676, 3.5]
   for element in row_1:
       print(element)
   ```

2. **Appending Values to a List**

   - Use `.append()` to add values to a list:

   ```python
   a_list = [1, 2]
   a_list.append(3)  # [1, 2, 3]
   ```

3. **Opening a Dataset File and Creating a List of Lists**

   - Use `csv` to read files:

   ```python
   opened_file = open('AppleStore.csv')
   from csv import reader
   read_file = reader(opened_file)
   apps_data = list(read_file)
   ```

4. **Converting a String to a Float**

   - Combine loops and type conversion to process data:

   ```python
   rating_sum = 0
   for row in apps_data[1:]:
       rating = float(row[7])
       rating_sum += rating
   ```

5. **Key Concepts**

   - **For Loops** automate repetitive processes.
   - A `for` loop starts with the `for` keyword and iterates over an **iterable** variable:

     ```python
     for element in app_ratings:
         # Code block (indented)
     ```

   - The **iteration variable** (`element`) takes on a new value for each iteration.
   - If the iterable (e.g., a list) has three elements, the loop body executes **three times**.

6. **Python Keywords**
   - `for` and `in` are examples of Python **keywords**.

### Summary

- For loops in Python allow automation of repetitive tasks.
- Use loops to process lists, append data, or perform calculations efficiently.
- Type conversions (e.g., `float()`) are often combined with loops when handling datasets.

#### Additional Resources

- [Python For Loops Documentation](https://docs.python.org/3/tutorial/controlflow.html#for-statements)
- [CSV File Basics](https://www.howtogeek.com/348960/what-is-a-csv-file-and-how-do-i-open-it/)
- [Dataquest Python Modules](https://dataquest.io/)

---

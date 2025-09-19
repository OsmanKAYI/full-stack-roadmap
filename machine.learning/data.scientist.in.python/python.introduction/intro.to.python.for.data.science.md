# Introduction to Python Programming for Data Science

## Python Programming

### Key Concepts

1. **Displaying Output**

   - Use the `print()` function to display the result of code execution:

     ```python
     print(1 + 2)   # Outputs: 3
     print(5 * 10)  # Outputs: 50
     ```

2. **Using Comments**

   - Comments start with `#` and are ignored by the computer:

     ```python
     # print(1 + 2)  # This line is ignored
     print(5 * 10)  # Outputs: 50
     ```

3. **Arithmetic Operations**

   - Python supports basic arithmetic:

     ```python
     1 + 2       # Addition
     4 - 5       # Subtraction
     30 * 12     # Multiplication
     120 / 3     # Division
     4 ** 3      # Exponentiation
     (4 * 18) ** 2 / 10  # Complex expressions
     ```

4. **Programming Basics**

   - **Programming**: Writing a set of instructions for the computer.
   - **Code**: The instructions written in a programming language.
   - **Program**: A collection of code that performs a task.

5. **Code Syntax**

   - Python has strict syntax rules. For example:

     ```python
     print(23 + 7)  # Correct
     print(10 - 6) print(12 + 38)  # Incorrect, causes a syntax error
     ```

6. **Input and Output**

   - **Input**: Code written as instructions for the computer.
   - **Output**: Results produced by executing the code.

7. **Code Comments**

   - Comments explain the code or disable certain lines from executing.
   - Example:

     ```python
     # This is a comment
     print("Hello, World!")  # Prints a greeting
     ```

### Summary

- **`print()`** displays program output.
- **`#` comments** are ignored during execution.
- Programming involves writing **code** that instructs the computer to perform tasks.
- Follow Python syntax rules to avoid errors.

#### Additional Resources

- [Dataquest Python Learning Modules](https://dataquest.io/)

---

## Programming Python Variables

### Key Points

1. **Storing Values in Variables**

   ```python
   twenty = 20
   result = 43 + 2**5
   currency = 'USD'
   ```

2. **Updating Variable Values**

   ```python
   x = 30
   x += 10  # Same as x = x + 10
   ```

3. **Syntax Shortcuts**

   - Common shorthand operations:

     ```python
     x += 2  # Addition
     x -= 2  # Subtraction
     x *= 2  # Multiplication
     x /= 2  # Division
     x **= 2 # Exponentiation
     ```

4. **Variable Naming Rules**

   - Use only **letters**, **numbers**, or **underscores**.
   - Do not start a variable name with a **number**.

5. **Assignment Operator (`=`)**

   - The `=` operator assigns a value to a variable.

     ```python
     x = 5  # Read as "x is assigned the value 5"
     ```

   - It does not denote equality.

6. **Error Types**

   - **Syntax Error**: Code structure is invalid.
   - **Runtime Error**: Code syntax is correct, but execution fails.

7. **Data Types**
   - Data types classify values, determining how the computer processes, stores, and operates on them.

---

### Concepts Learned

- Variables are **storage locations** in memory.
- The `=` operator is an **assignment operator**, not a symbol of equality.
- Syntax shortcuts simplify arithmetic operations.

#### Additional Resources

- [Dataquest Python Learning Modules](https://dataquest.io/)

---

## Python Data Types: Integers, Floats, Strings

### Key Points

1. **Rounding a Number**

   ```python
   round(4.99)  # Output: 5
   ```

2. **Creating Strings**

   - Using quotation marks to define strings:

     ```python
     app_name = "Clash of Clans"
     app_rating = '3.5'
     ```

3. **Concatenating Strings**

   - Combining two or more strings:

     ```python
     print('a' + 'b')      # Output: 'ab'
     print('a' + 'b' + 'c')  # Output: 'abc'
     ```

4. **Type Conversion**

   - Converting between data types:

     ```python
     int('4')      # Converts string to integer
     str(4)        # Converts integer to string
     float('4.3')  # Converts string to float
     str(4.3)      # Converts float to string
     ```

5. **Finding the Type of a Value**

   ```python
   type(4)      # Output: <class 'int'>
   type('4')    # Output: <class 'str'>
   ```

---

### Concepts Learned

- **Data Types**: Introduced integers, floats, and strings.
- **String Concatenation**: Linking two or more strings.

#### Additional Resources

- [Python Documentation on Strings](https://docs.python.org/3/tutorial/introduction.html#strings)
- [Dataquest Python Learning Modules](https://dataquest.io/)

---

## Python Lists

### Key Points

1. **Creating a List of Data Points**

   ```python
   row_1 = ['Facebook', 0.0, 'USD', 2974676, 3.5]
   row_2 = ['Instagram', 0.0, 'USD', 2161558, 4.5]
   ```

2. **Creating a List of Lists**

   ```python
   data = [row_1, row_2]
   ```

3. **Retrieving Elements from a List**

   - Access specific elements using index notation:

     ```python
     first_row = data[0]                       # First list in data
     first_element_in_first_row = first_row[0] # 'Facebook'
     last_element_in_first_row = first_row[-1] # 3.5
     # Shortcut for nested lists:
     first_element_in_first_row = data[0][0]   # 'Facebook'
     last_element_in_first_row = data[0][-1]   # 3.5
     ```

4. **Creating a New List from Elements**

   - Extract elements to form a new list:

     ```python
     row_1 = ['Facebook', 0.0, 'USD', 2974676, 3.5]
     rating_data_only = [row_1[3], row_1[4]]   # [2974676, 3.5]
     ```

5. **List Slicing**

   - Extract a range of elements:

     ```python
     row_1 = ['Facebook', 0.0, 'USD', 2974676, 3.5]
     second_to_fourth_element = row_1[1:4]    # [0.0, 'USD', 2974676]
     ```

6. **Key Concepts**
   - **Data Point**: A single value providing information.
   - **Dataset**: A collection of data points (e.g., tables).
   - **Lists**: A Python data type used to store datasets.

### Summary

- Python lists can store individual data points or datasets like tables.
- You can access, slice, or manipulate list elements using **indexing** and **slicing**.
- Lists are versatile for working with data collections in Python.

#### Additional Resources

- [Python Lists Documentation](https://docs.python.org/3/tutorial/introduction.html#lists)
- [CSV File Basics](https://www.howtogeek.com/348960/what-is-a-csv-file-and-how-do-i-open-it/)
- [Dataquest Python Modules](https://dataquest.io/)

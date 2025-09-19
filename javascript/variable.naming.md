# Variable Naming Best Practices in JavaScript

**TLDR:** Well-chosen variable names significantly improve the readability and maintainability of JavaScript code. Adopting modern conventions like `let` and `const`, using meaningful names, and following naming patterns such as camel case and uppercase constants help maintain cleaner, more structured code. Avoid abbreviations, single-letter variables, and combine good practices to ensure clarity.

## 1. Avoid `var`: Outdated and Unpredictable

Prior to ES6, `var` was used to declare variables, but it introduced unpredictable behavior due to function-level scoping. Modern JavaScript uses `let` and `const` for block-scoped, more manageable variables, reducing bugs and increasing code clarity.

```javascript
// Use let and const instead of var
let age = 25;
const name = 'John';
```

## 2. Use `let` for Reassignable Variables

`let` should be used when the variable's value may change later in the code.

```javascript
let count = 0;
count++;
```

## 3. Use `const` for Constants

For values that remain unchanged throughout the code, use `const`. This ensures consistency and prevents accidental reassignment.

```javascript
const TAX_RATE = 0.15;
```

## 4. Clear and Descriptive Naming

Variable names should be self-explanatory, indicating their purpose. Avoid unclear, ambiguous names.

```javascript
// Good
let firstName = 'Alice';
let totalPrice = 50;

// Bad
let x = 'Alice';
let temp = 50;
```

## 5. Avoid Abbreviations

Names should be written out clearly to avoid confusion, especially when working with other developers.

```javascript
// Good
let customerName = 'Alice';

// Bad
let custNm = 'Alice';
```

## 6. Use Camel Case

Camel case is widely adopted in JavaScript for variable names, where the first word is lowercase and subsequent words are capitalized.

```javascript
// Good
let fullName = 'John Doe';

// Bad
let full_name = 'John Doe';
```

## 7. Uppercase for Constants

Constants that remain unchanged should be written in uppercase, with words separated by underscores.

```javascript
// Good
const MAX_ATTEMPTS = 3;

// Bad
const maxAttempts = 3;
```

## 8. Avoid Single-Letter Variables

Single-letter variables generally decrease readability. Use descriptive names, except in specific cases like loop counters.

```javascript
// Good
let counter = 0;

// Bad
let i = 0;
```

## 9. Use Plurals for Arrays

When naming arrays, use plural forms to indicate that the variable holds multiple values.

```javascript
// Good
let productNames = ['Item1', 'Item2'];

// Bad
let productName = ['Item1', 'Item2'];
```

## 10. Prefix Boolean Variables

Boolean variables should start with prefixes like `is`, `has`, or `can` to clearly indicate their purpose.

```javascript
// Good
let isActive = true;
let hasDiscount = false;

// Bad
let active = true;
let discountApplied = false;
```

## 11. Scope-Aware Naming

When dealing with scoped variables, indicate the scope in the name to differentiate them from global variables.

```javascript
// Good
let globalCounter = 100;
let localIndex = 5;

// Bad
let counter = 100;
let index = 5;
```

## 12. Declare Variables Separately

For readability, declare variables one by one, rather than bundling multiple declarations into a single line.

```javascript
// Good
let isActive = true;
let canEdit = false;

// Bad
let isActive = true,
  canEdit = false;
```

Following these practices leads to cleaner, more predictable code, making collaboration and long-term maintenance easier.

**Ref:** [Hayk Simonyan - Medium](https://javascript.plainenglish.io/variable-naming-best-practices-in-javascript-94af115f42cd)

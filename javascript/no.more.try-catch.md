# New JavaScript Operator (?=) is an Absolute Game Changer

**TLDR:** The new safe assignment operator (`?=`) revolutionizes JavaScript error handling, enabling cleaner, more readable code without deep nesting or excessive try-catch blocks.

---

![Image](https://miro.medium.com/v2/resize:fit:700/1*INT5dtKotyP0at13wyjJLg.png)

A remarkable new JavaScript operator has emerged, transforming the approach to error handling!

With the **safe assignment operator**, redundant patterns can be avoided:

![Image](https://miro.medium.com/v2/resize:fit:700/1*X6Uc4EocVsFhhrJEG7PrgA.png)

This allows for more straightforward coding:

![Image](https://miro.medium.com/v2/resize:fit:700/1*2jpy63Ip9VuXantyGZab6A.png)

Deep nesting is eliminated, resulting in significantly cleaner and more readable code.

Instead of encountering errors in cumbersome `catch` blocks:

![Image](https://miro.medium.com/v2/resize:fit:700/1*EVKpxdNMaJUkAgJ3kH_IVQ.png)

All operations can now be executed in a single line.

Rather than loudly failing, `?=` silently manages errors, allowing for flexible responses.

![Image](https://miro.medium.com/v2/resize:fit:700/1*LJe6O23yKkqj0rK5kZt5oA.png)

Responses can vary:

![Image](https://miro.medium.com/v2/resize:fit:700/1*4lyqFfUFTmhvTmJH2L0Ytg.png)

Errors can be reported without disrupting the flow:

![Image](https://miro.medium.com/v2/resize:fit:700/1*-PL0bV-VCYx0zYyq1vyjDQ.png)

Or the process can be halted immediately:

![Image](https://miro.medium.com/v2/resize:fit:700/1*vqFw2TEUxhj9yxl48aN4OQ.png)

This feature proves to be a powerful tool for creating **guard clauses**:

![Image](https://miro.medium.com/v2/resize:fit:700/1*iCaA9G1L03_q_3n7W8TJZA.png)

One of the most advantageous aspects of this operator is its capability to manage values depending on the presence of exceptions.

Typically, a mutable variable outside the scope would be utilized for error-free access:

![Image](https://miro.medium.com/v2/resize:fit:700/1*FVL4x2OmgInfuUDGFhVrqw.png)

This approach can lead to frustration, particularly when striving for immutability and the variable was previously declared as `const`.

In the past, it required wrapping in a `try`, removing `const`, declaring `let` outside, and reassigning within `catch`.

With `?=`:

![Image](https://miro.medium.com/v2/resize:fit:700/1*-us2-zeVKH7kFaY1j2EZkA.png)

Immutability is preserved, leading to more intuitive code, while eliminating all nesting.

## How does it work?

The new `?=` operator calls the `Symbol.result` method internally.

When executing this:

![Image](https://miro.medium.com/v2/resize:fit:700/1*prkF7TE8KrShjsPvcLo68g.png)

The following occurs:

![Image](https://miro.medium.com/v2/resize:fit:700/1*jREq4bDr7xUg5p96870njQ.png)

This implies compatibility with ANY object implementing `Symbol.result`:

![Image](https://miro.medium.com/v2/resize:fit:700/1*pW6pYx8KfPUaC9Hshwbk7g.png)

Throwing errors remains an option:

![Image](https://miro.medium.com/v2/resize:fit:700/1*qtw4yiduKZCQoKJIhmD-Iw.png)

A notable feature is that if `result` has its own `Symbol.result` method, `?=` will drill down recursively:

![Image](https://miro.medium.com/v2/resize:fit:700/1*zdM_LOKv2tMLIFalVXzXXg.png)

Direct usage of the object instead of returning from a function is also possible:

![Image](https://miro.medium.com/v2/resize:fit:700/1*TJOmkRDlHTo19rMOv574mg.png)

Its versatility allows for seamless integration with both standard and `await`ed functions:

![Image](https://miro.medium.com/v2/resize:fit:700/1*a86p3bkQLxYN-Jr1r_x2uw.png)

## Using

The `?=` operator is compatible with the TypeScript `**using**` keyword for automatic resource cleanup after use.

❌ Before:

![Image](https://miro.medium.com/v2/resize:fit:700/1*aCjhbCK6vDtSznPnHs4d3A.png)

✅ After:

![Image](https://miro.medium.com/v2/resize:fit:700/1*twidCIe_taxVej4OW8W61g.png)

## How to use it now

While waiting for native integration of `?=` in JavaScript, it can be implemented now using [this polyfill](https://github.com/arthurfiorette/proposal-safe-assignment-operator/blob/main/polyfill.js):

Direct usage isn’t possible—`Symbol.result` will be required:

![Image](https://miro.medium.com/v2/resize:fit:700/1*YrGctUYIIx4Mhu9sW3pLOw.png)

## Final thoughts

JavaScript error handling has become much more readable and intuitive with the introduction of the safe assignment operator (`?=`).

Utilize this operator to write cleaner and more predictable code.

**Ref:** [Tari Ibaba - Medium](https://medium.com/coding-beauty/new-javascript-operator-1e60dea05654)

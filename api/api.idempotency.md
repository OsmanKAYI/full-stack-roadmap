# Idempotency in REST APIs

Understanding idempotency — managing repeated requests for reliability and data consistency.

---

## What Is Idempotency?

- From Latin: **idem** (same) + **potent** (powerful/effective) → "having the same effect".
- In math: a function is **idempotent** if applying it once or repeatedly yields the same result.
  - `f(x) = |x|` → idempotent (result doesn't change on re-application)
  - `f(x) = x + 1` → not idempotent (result changes every time)
- In software: an operation is idempotent when performing it multiple times has the same effect as performing it once.

> **Idempotency** = noun, **idempotent** = adjective.

---

## HTTP Methods and Idempotency

| Method     | Idempotent?  | Why                                                                                                                      |
| ---------- | ------------ | ------------------------------------------------------------------------------------------------------------------------ |
| **GET**    | Yes          | Reads data; repeating the request doesn't change server state.                                                           |
| **POST**   | No (usually) | Creates a new resource / triggers an action each call — duplicates possible. Manageable with an **idempotency key**.     |
| **PUT**    | Yes          | Full update/upsert; the resource ends up in the same state no matter how many times it's sent.                           |
| **PATCH**  | Usually no   | Partial updates may be cumulative (e.g. "raise salary by 20%" twice → +44%). Can be made idempotent with careful design. |
| **DELETE** | Yes          | After deletion, repeating the request changes nothing.                                                                   |
| **HEAD**   | Yes          | Same as GET, no body.                                                                                                    |

> Edge case: `DELETE kayas.dev/posts/last` is **not** idempotent — each call deletes a different "last" post.

---

## Why It Matters in Practice

1. **Network problems & retries** — User pays on an e-commerce site, connection drops before the response. They retry → without idempotency, **duplicate orders**.
2. **User experience** — Bank transfer on a flaky connection; pressing "Send" again can **debit the account twice** if the endpoint isn't protected.
3. **Data consistency & security** — PUT updates are safe to repeat; unprotected PATCH/POST retries can corrupt state.
4. **Performance & scalability** — Idempotent GETs can be safely **cached**; non-idempotent POSTs without protection can double-book resources (e.g. same hotel room sold twice).

---

## The Fix: Idempotency Key

The goal: process a request only once; for repeats, return the **first stored response**. The server should know: _"I already did this — no need to repeat."_

### How it works

1. **Client generates a key** — a unique `idempotency key` (usually a GUID/UUID), created when the page loads or before the transaction starts.
2. **Sent with the request** — as an HTTP header (e.g. `Idempotency-Key: <uuid>`) or form field.
3. **Server checks the key** — looks it up in a cache or database.
4. **Decision:**
   - Key unseen → process the request, store the response under the key.
   - Key seen → skip processing, return the stored response.

### Real-life example: payment

User clicks "Pay", connection is slow, they click several more times:

- Without a key → multiple charges possible.
- With a key → only the first request is processed; the rest get the same stored result.

### War story: Uber Eats India × Paytm

An outage suspected to be idempotency-related:

- Paytm (payment provider) originally returned a single uniform error message.
- An update added a **different error message** for second failed attempts — without properly notifying API consumers.
- Uber Eats' system only handled the old messages, so some failed transactions were treated as successful → **orders were processed repeatedly**.

Lesson: contract changes on the provider side + missing idempotent handling = duplicate processing.

---

## Summary

- Idempotency prevents errors from repeated requests, keeps data consistent, enables safe caching, and directly affects user satisfaction.
- Safe-by-default methods: GET, PUT, DELETE, HEAD.
- Protect POST (and careless PATCH) with an **idempotency key**.

**Ref:** [Idempotency'yi Anlamak: Yazılımda Tekrarlanan Taleplerin Yönetimi — Görkem Kaya (Kodcular)](https://medium.com/kodcular/idempotencyyi-anlamak-yaz%C4%B1l%C4%B1mda-tekrarlanan-taleplerin-y%C3%B6netimi-21fabb94ad97)

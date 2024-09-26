# Handling Environment Variables in Vue

Vue uses the widely adopted dotenv module to load build configuration from the following files in your environment directory:

```bash
.env                # loaded in all cases
.env.local          # loaded in all cases, ignored by git
.env.[mode]         # only loaded in specified mode
.env.[mode].local   # only loaded in specified mode, ignored by git
```

Each file has the following format

```bash
VITE_SOME_KEY=123
DB_PASSWORD=secret
```

Everything that has the VITE_ prefix will automatically be available in the client application inside import.meta.env

```js
<script setup>
console.log(import.meta.env.VITE_SOME_KEY) // "123"
</script>
```

- In case you are using vue-cli instead the prefix is VUE_

Other parts of the application can securely use the .dotenv file without the VITE_ prefix so variables will not leak to the client.

That was easy so far. In a real-life scenario, you will have multiple config files for each environment.

For example locally

```bash
# .env.local
VITE_BACKEND_URL=http://localhost:3000/
VITE_PUBLIC_URL=http://localhost:3000/uploads/
```

And for production

```js
# .env.production
VITE_BACKEND_URL=http://example.com/
VITE_PUBLIC_URL=http://example.cloudflare.com/uploads/
```

On the client side, we can use these variables directly since they are globally available

```js
// /lib/fetch.ts

import axios from "axios";

const instance = axios.create({
  baseURL: import.meta.env.VITE_BACKEND_URL,
});
```

In case you are using typescript (you should, right?) you might see a not-that-helpful error

```bash
Property 'env' does not exist on type 'ImportMeta'.ts(2339)
```
To make TS happy create the file src/types/vite-env.d.ts with the following content.

```ts
/// <reference types="vite/client" />

interface ImportMetaEnv {
  readonly VITE_PUBLIC_URL: string;
  readonly VITE_BACKEND_URL: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
```

Lastly, I find it a bit verbose to refer to import.meta.env.VITE_BACKEND_URL in my code. I usually create an intermediate appSettings.ts file to encapsulate it.

```ts
// src/config/appSetings.ts

export default {
  baseURL: import.meta.env.VITE_BACKEND_URL,
  publicUrl: import.meta.env.VITE_PUBLIC_URL,
};
```

which makes our original code simpler.

```js
import axios from "axios";
import { baseUrl } from "@/config/appSetings"

const instance = axios.create({
  baseURL,
});
```

**Ref:** [Fotis Adamakis - Medium](https://fadamakis.com/handling-environment-variables-in-vue-da4d223aea71)
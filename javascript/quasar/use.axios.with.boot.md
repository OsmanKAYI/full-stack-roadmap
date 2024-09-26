# Using Axios with Boot File

## TLDR

- Configure Axios globally using a boot file.
- Access Axios as `this.$axios` or `this.$api` across your project.
- This setup ensures a cleaner, more centralized Axios usage.

Using the boot file together with Axios can be very effective. The boot file is ideal for configuring Axios globally, defining a base URL, adding interceptors, and easily using Axios across all pages. For example:

- **In `boot/axios.ts`**

```typescript
import { boot } from 'quasar/wrappers';
import axios from 'axios';

const api = axios.create({
  baseURL: 'https://api.example.com', // Base URL definition
  timeout: 10000 // Timeout value
});

export default boot(({ app }) => {
  // Adding Axios to the Vue instance
  app.config.globalProperties.$axios = axios;
  app.config.globalProperties.$api = api;
});

export { api };
```

In this way, you can use Axios throughout the project as `this.$axios` or `this.$api`.

## Usage

```typescript
// in any .vue file
this.$api.get('/endpoint').then(response => {
  console.log(response.data);
});
```

This approach makes the configuration and use of Axios more organized and centralized.

- To learn how to [work with a constants file](../vue/work.with.constants.file.md), you can follow the link.

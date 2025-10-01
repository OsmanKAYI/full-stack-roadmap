# Mobile Dev Access Fix (Local LAN)

## Summary

- **[Problem]** Mobile devices could not access the backend when opening the SPA over LAN; frontend loaded but API calls failed with “Network error” and/or `timeout of 10000ms exceeded`.
- **[Root cause]** Frontend used `localhost` for API (`VITE_API_BASE_URL=http://localhost:8000/api/v1`). On a phone, `localhost` points to the phone itself, not the dev machine.
- **[Solution]** Expose the Quasar dev server to LAN and proxy all `/api` requests to the local backend. Then use a relative API base path in the frontend.

## Changes Applied

- **In your terminal** to allow port 9000 to be accessible from the LAN

  ```bash
  sudo ufw allow 9000/tcp
  ```

- **[Expose dev server to LAN]** `frontend/quasar.config.ts`

  ```ts
  devServer: {
    open: false,
    port: 9000,
    host: '0.0.0.0',
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8000',
        changeOrigin: true,
        secure: false,
      },
    },
  },
  ```

- **[Use relative API base URL]** `frontend/.env`

  ```env
  VITE_API_BASE_URL=/api/v1
  ```

  This ensures all API requests go to the Quasar dev server first, which proxies them to the backend.

- **[Axios timeout (optional)]** `frontend/src/services/api.ts`

  ```ts
  const api = axios.create({
    baseURL: import.meta.env.VITE_API_BASE_URL || 'http://localhost:8000/api/v1'
    // Consider increasing timeout for slower mobile networks
    // timeout: 30000,
  });
  ```

## Verification Steps

1. Restart the dev server after config/env changes:
   - From `frontend/`: `quasar dev`
2. Open from the phone (same Wi‑Fi):
   - `http://<DEV_MACHINE_LAN_IP>:9000/`
3. Confirm API requests are sent to `/api/v1/...` and return 2xx.
4. Backend logs should show requests received at `http://127.0.0.1:8000` via proxy.

## Why this works

- The SPA and API appear to be same-origin to the phone (`http://<PC-IP>:9000`).
- The Vite/Quasar dev server proxies `/api` to the backend on the dev machine (`127.0.0.1:8000`).
- No CORS headaches and no need to open backend port to the LAN, reducing exposure.

## Alternative (without proxy)

- Point `VITE_API_BASE_URL` to the dev machine’s LAN IP (e.g., `http://192.168.1.98:8000/api/v1`).
- Ensure the backend listens on `0.0.0.0` and the firewall allows the port (e.g., `ufw allow 8000/tcp`).
- Drawback: exposes backend to LAN and may still require CORS config.

## Troubleshooting Checklist

- **Dev server bind**: `host: '0.0.0.0'` and verify it’s reachable: `http://<PC-IP>:9000`.
- **Proxy path**: Frontend uses `VITE_API_BASE_URL=/api/v1`, proxy key is `/api` (no rewrite needed).
- **Backend availability**: Backend reachable from the dev machine: `curl http://127.0.0.1:8000/api/v1`.
- **Firewall**: Only the dev server port (e.g., 9000) needs LAN access when using proxy. If you expose backend explicitly, open that port as well.
- **Same network**: Phone and dev machine must share the same Wi‑Fi subnet; disable AP/client isolation if present.

## Files Changed

- `frontend/quasar.config.ts`
- `frontend/.env`
- `frontend/src/services/api.ts` (optional timeout)

## Notes

- If HMR fails on device, you may set a custom HMR client port in `quasar.config.ts` (rarely needed):

  ```ts
  // hmr: { clientPort: 9000 }
  ```

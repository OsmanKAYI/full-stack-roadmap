# Nginx Reverse Proxy Setup

This guide explains how to run the Laravel backend over HTTPS behind Nginx while the app server itself (php artisan serve) listens on a localhost port. The sample config terminates TLS at Nginx and proxies traffic to the backend on 127.0.0.1:8000.

## Prerequisites

- Ubuntu/Debian server with Nginx installed
- OpenSSL or an existing certificate/key pair
- Backend running locally (e.g., `php artisan serve --host=0.0.0.0 --port=8000`)
- Optional: Frontend (Quasar) can run on a separate port during development

## File Locations

- Nginx site config: `/etc/nginx/sites-available/$PROJECT_NAME.conf`
- SSL certificate: `/PATH/TO/$PROJECT_NAME/backend/certs/dev.crt`
- SSL private key: `/PATH/TO/$PROJECT_NAME/backend/certs/dev.key`

> Replace paths with your own in production. Never commit private keys publicly.

## Example Nginx Server Block

```config
server {
  listen 8222 ssl;
  listen [::]:8222 ssl;
  server_name $IP_ADDRESS $ANOTHER_IP_ADDRESS ;

  ssl_certificate     /PATH/TO/$PROJECT_NAME/backend/certs/dev.crt;
  ssl_certificate_key /PATH/TO/$PROJECT_NAME/backend/certs/dev.key;

  # Stronger TLS (optional, adjust to your needs)
  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_ciphers HIGH:!aNULL:!MD5;
  ssl_prefer_server_ciphers on;

  # Redirect well-known HTTP to HTTPS (optional separate :80 server)
  # server {
  #   listen 80;
  #   server_name $IP_ADDRESS $ANOTHER_IP_ADDRESS ;
  #   return 301 https://$host:8222$request_uri;
  # }

  location / {
    proxy_pass         http://127.0.0.1:8000;
    proxy_http_version 1.1;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Proto https;
    proxy_set_header   X-Forwarded-Host $host;
    proxy_set_header   X-Forwarded-Port $server_port;

    # Websockets/support for SSE if used
    proxy_set_header   Upgrade $http_upgrade;
    proxy_set_header   Connection $connection_upgrade;

    # Timeouts (tune as necessary)
    proxy_connect_timeout   60s;
    proxy_send_timeout      60s;
    proxy_read_timeout      60s;
  }

  # Static storage served via backend (proxied)
  location /storage/ {
    proxy_pass http://127.0.0.1:8000;
  }
}
```

## Enable the Site

```bash
sudo ln -s /etc/nginx/sites-available/$PROJECT_NAME.conf /etc/nginx/sites-enabled/$PROJECT_NAME.conf
sudo nginx -t
sudo systemctl reload nginx
```

## Generate a Self-Signed Certificate (Development)

```bash
mkdir -p /var/www/html/cansu/$PROJECT_NAME/backend/certs
openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout /var/www/html/cansu/$PROJECT_NAME/backend/certs/dev.key \
  -out   /var/www/html/cansu/$PROJECT_NAME/backend/certs/dev.crt \
  -days 365 \
  -subj "/CN=$IP_ADDRESS"
```

## Laravel Considerations

- Set `APP_URL=https://$IP_ADDRESS:8222` in `.env` so generated URLs use HTTPS and correct port.
- If you terminate TLS at Nginx, tell Laravel to trust proxy headers so `request()->secure()` works:

  In `App\Http\Middleware\TrustProxies` ensure `protected $proxies = '*';` and `protected $headers = Request::HEADER_X_FORWARDED_ALL;` (or configure exact proxy IPs).

- If using file downloads or Storage URLs, make sure `APP_URL` matches the public scheme/host/port.

## Frontend (Quasar) Notes

- During development, Quasar typically runs at `http://localhost:9000`.
- If you need to proxy frontend through Nginx as well, create another server block (optionally without SSL) or add a path location to forward to `9000`.

## Troubleshooting

- `nginx -t` must pass before reload.
- Browser shows certificate warning with self-signed certs; import or trust the dev CA if needed.
- 502 Bad Gateway: ensure backend is running on `127.0.0.1:8000` and firewall permits localhost.
- Mixed Content: ensure `APP_URL` is HTTPS and the app generates https links.
- Wrong host/port in redirects: add `proxy_set_header X-Forwarded-Host` and `X-Forwarded-Port` as shown.

## Security Notes

- Use real certificates (Let’s Encrypt) in production and rotate keys routinely.
- Restrict `server_name` to the exact domain, avoid broad IP wildcards in public networks.
- Consider rate limiting, request size limits, and WAF in production.

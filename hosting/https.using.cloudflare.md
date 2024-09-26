# Step-by-Step Guide to Adding HTTPS with Cloudflare

Adding an HTTPS certificate to your website using Cloudflare involves several steps. Here's a professional and clear guide to help you through the process:

## Step 1: Sign Up or Log In to Cloudflare

1. **Sign Up**: If you don't have a Cloudflare account, sign up at [Cloudflare](https://www.cloudflare.com/).
2. **Log In**: If you already have an account, log in.

## Step 2: Add Your Website to Cloudflare

1. **Add a Site**: Click on "Add a Site" in the Cloudflare dashboard.
2. **Enter Domain**: Enter your domain name and click "Add Site".
3. **Plan Selection**: Choose a plan (Free, Pro, Business, or Enterprise). For HTTPS, the Free plan is sufficient.

## Step 3: Update DNS Settings

1. **Scan DNS Records**: Cloudflare will automatically scan your existing DNS records.
2. **Verify Records**: Ensure all your DNS records are correctly listed. Add any missing records manually.
3. **Nameserver Update**: Cloudflare will provide you with nameservers. Update your domain registrar's nameservers to the ones provided by Cloudflare from your domain provider (such as [IHS](https://www.ihs.com.tr/), [Squarespace](https://www.squarespace.com/)).

## Step 4: Configure SSL/TLS Settings

1. **SSL/TLS Tab**: Go to the SSL/TLS section in the Cloudflare dashboard.
2. **SSL Mode**: Choose an SSL mode:
   - **Flexible**: Encrypts traffic between the browser and Cloudflare, but not between Cloudflare and your web server.
   - **Full**: Encrypts traffic between the browser and Cloudflare and between Cloudflare and your web server. Requires a self-signed certificate on your web server.
   - **Full (Strict)**: Same as Full, but requires a valid SSL certificate on your web server.

   For most secure configurations, use **Full (Strict)**.

## Step 5: Enable Always Use HTTPS

1. **Edge Certificates**: In the SSL/TLS settings, navigate to the "Edge Certificates" section.
2. **Always Use HTTPS**: Toggle the switch to enable "Always Use HTTPS". This will redirect all HTTP requests to HTTPS.

## Step 6: Verify HTTPS Configuration

1. **Propagation Time**: Wait for DNS changes to propagate, which can take up to 24 hours.
2. **Test Your Site**: After propagation, visit your website using `https://yourdomain.com` to verify it loads with HTTPS.
3. **Check Certificate**: Click on the padlock icon in the browser's address bar to view the certificate details and confirm it is issued by Cloudflare.

## Step 7: Optimize SSL/TLS Settings (Optional)

1. **Auto Minify**: Enable auto minify for JavaScript, CSS, and HTML in the "Speed" section.
2. **Brotli Compression**: Enable Brotli compression in the "Speed" section for improved performance.
3. **HSTS (HTTP Strict Transport Security)**: In the SSL/TLS settings, enable HSTS to enforce HTTPS and add additional security.

## Additional Tips

- **Firewall Rules**: Configure firewall rules in Cloudflare to protect your site from malicious traffic.
- **Page Rules**: Use page rules to create specific behaviors for different parts of your site, such as caching policies or redirects.

By following these steps, you'll successfully add an HTTPS certificate to your website using Cloudflare, ensuring secure and encrypted connections for your visitors.

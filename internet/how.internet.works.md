# How Does the Internet Work?

When we want to go to www.$domainname.com in our browser, the following steps are followed:

1. Check the browser cache to see if the site is familiar.
2. Check the `/etc/host` file for linux and `C:\Windows\System32\drivers\etc\hosts` file for windows on computer (is not always performed, as it depends on whether the domain name has been previously accessed and cached on the computer).
3. Check the defined DNS Server (8.8.8.8.8,8.8.4.4 Google DNS / 1.1.1.1.1,1.0.0.1 Cloudflare DNS). If there is no registered DNS Server, the default server is the DNS Server of the service provider (Vodafone, Kablonet, etc.)
4. The defined DNS Server goes to one of the Root Servers (13 in total). These Root Servers hold only the information of the distributors of domain names like **.com**, **.com.tr** etc. This is called TLD (Top Level Domain) information.

- But in some cases, when a DNS server needs to resolve a domain name, it may need to query multiple levels of DNS servers, not just the root servers. The root servers hold information about the top-level domain (TLD) servers, which in turn hold information about the authoritative name servers for the domain being queried.

5. Again DNS Server, goes to the TLD Server, obtains the IP address of the Name Server (NS) where NS is responsible for providing the IP address of the website files when requested by the DNS server and passes this information to the browser.
6. Tshe browser sends an HTTP request to the server at the IP address obtained from the DNS server, which then sends back the website files as an HTTP response.

- When we try to reach **www.osmankayi.com** through the browser, by pinging, etc. (assuming we have not accessed this site from our computer before), the following sequence is followed after the first 3 steps mentioned above are performed.

  - One of the DNS Root Servers informs the defined DNS Server who the **.com** TLD is.
    **NOTE:** The TLD must point to at least 2 locations for each domain name.
  - Based on the information received, the DNS Server finds the TLD and asks it for the IP address of **www.osmankayi.com**.
  - The TLD gives the following answer to the DNS Server: "94.103.47.122 www.osmankayi.com" and the result is passed by the DNS Server to the browser.
    **NOTE:** The amount of time that the resolved IP address will be cached by the DNS server is called TTL (Time to Live).
  - The browser displays the site according to the IP information it has received.  
    **NOTE:** The result can be confirmed by going to dnschecker.org and searching for **www.osmankayi.com**.

**NOTE:** Any changes made to the IP address (DNS propagation) are captured by the DNS Servers after a certain period of time. Therefore, it is preferable to change the IP address at night to avoid any confusion.

## Some DNS Record Types

| Record Type      | Function                                                                         |
| ---------------- | -------------------------------------------------------------------------------- |
| DNS A Record     | Direct server IP address. Specifies where to look when the domain name is typed. |
| DNS CNAME Record | Subdomain definition (Example: Project page)                                     |

- The DNS record types mentioned in the table are not the only record types used in the DNS system. There are many other record types used for various purposes, such as TXT records for storing arbitrary text data, SRV records for defining the location of services, and NS records for delegating authority to name servers.

**NOTE:** For CNAME records, the address to be redirected to is hidden in the **value** part of the CNAME record.

#### Example

| Address              | Registration Type |
| -------------------- | ----------------- |
| osmankayi.com        | A                 |
| tr.osmankayi.com     | CNAME             |
| person@osmankayi.com | MX (email server) |

**The DNS A Record contains the information on which computer the domain name is located. Depending on this, CNAME etc. records are retrieved.**

**NOTE:** The `dig www.osmankayi.com` command allows us to query the domain name. As a result, it shows us the "CNAME" and "A" record(s), if any.

- See the useful links below:
  - [DNS System Hierarchy](https://pbs.twimg.com/media/FvM3S0VWcAA4B8C?format=jpg&name=large)

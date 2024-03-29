# What is DNS?

Every computer on the Internet identifies itself with an “Internet Protocol” or “IP” address, which is a series of numbers — just like a phone number. That means you can contact any of those computers by typing in the website name, or you can type the IP address into your browser address bar. Either method will get you to the same destination. All servers that host websites and apps on the internet have IP addresses, too.

There are two types of DNS servers: authoritative and recursive. Authoritative nameservers are like the phone book company that publishes multiple phone books, one per region. Recursive DNS servers are like someone who uses a phone book to look up the number to contact a person or company. Keep in mind, these companies don’t actually decide what number belongs to which person or company — that’s the responsibility of domain name registrars.

## What is a Recursive DNS Server?

When you type a website address into your browser address bar, it might seem like magic happens. In reality, the DNS system makes effortless internet browsing possible. First, your browser connects to a recursive DNS server. There are many thousands of recursive DNS servers in the world. Many people use the recursive DNS servers managed by their Internet Service Provider (ISP) and never change them.

Once your computer connects to its assigned recursive DNS server, it asks the question “what’s the IP address assigned to that website name?” The recursive DNS server doesn’t have a copy of the phone book, but it does know where to find one. So it connects to another type of DNS server to continue the search.

## What is an Authoritative DNS Nameserver?

The second type of DNS server holds a copy of the regional phone book that matches IP addresses with domain names. These are called **Authoritative DNS Servers**. Authoritative DNS nameservers are responsible for providing answers to recursive DNS nameservers about where specific websites can be found. These answers contain important information for each domain, like IP addresses.

Like phone books, there are different authoritative DNS servers that cover different regions (a company, the local area, your country, etc.) No matter what region it covers, an authoritative DNS server performs two important tasks. First, it stores lists of domain names and their associated IP addresses. Second, it responds to requests from a recursive DNS server (the person who needs to look up a number) about the correct IP address assigned to a domain name. After getting the answer, the recursive DNS server sends that information back to the computer (and browser) that requested it. The computer connects to the IP address, and the website loads, leading to a happy user who can go on with their day.

<img src='https://cdn.umbrella.marketops.umbrella.com/wp-content/uploads/2020/06/16092413/What-is-the-difference-between-Authoritative-and-Recursive-DNS-Nameservers_Cisco-Umbrella-blog_DNS-server-diagram-1024x553.jpg' title='The Workflow of Recursive & Authoritative DNS Servers'>

**Ref:** https://umbrella.cisco.com/blog/what-is-the-difference-between-authoritative-and-recursive-dns-nameservers

# Domain Name Server (DNS)

Computers don't understand human language, so how do they know where to send you?

## What are URLs?

People use URL's daily to share videos, pictures, sites, articles – almost anything on the internet.

URL is an acronym for **Uniform Resource Locator**, and we can break them down into multiple smaller "pieces". Here's what makes up a standard URL:

<div style="text-align: center;">
  <img src="https://www.freecodecamp.org/news/content/images/2023/02/image-264.png">
</div>

A **URL** is just an address for a resource. The resources differ like we discussed, but they're just pointers all over the internet to take you to content you want to view.

As you can see in the graphic above, the breakdown of a URL is often:

**Scheme:** this is the protocol a browser uses to access your content. Normally for websites it's HTTP (insecure), or HTTPS (secure).
**Domain name:** the website name ("www.google.com" here)
**Port:** a network port (80 in this example)
**Path:** a path to a particular resource on the server
**Parameters:** often key-value pairs, to serve extra data to the web server.

## What are IP Addresses?

Humans and computers navigate the web very differently. While most humans use URL's like we just discussed, to communicate between computers, computers use the Internet Protocol (IP).

The IP is a set of rules that route and address data packets (all the data you want to view) to make sure it arrives to your computer.

The Internet Protocol relies on devices and domains, all having their own IP address to connect and identify all the different segments (packets!) of the internet.

An IP address is a series of standardised numbers that range from 0 to 255 – separated by dots.

If you want to see IP addresses in action, and are familiar with terminals, you can type `ping google.com` in whichever terminal you like and you can see the IP address of Google.com.

<div style="text-align: center;">
  <img src="https://www.freecodecamp.org/news/content/images/2023/03/image-56.png">
</div>

You can test this further by typing 216.58.212.206 directly into your browser and seeing if it takes you to Google.

Note that some IP addresses change day to day (called dynamic IP addresses) – so the above IP address may not work, depending on if the IP address is dynamic or static.

Static IP addresses are ones that don't change – but to assign a single IP address to every machine would be impractical. It would be a logistical nightmare, too, as some people only log onto computers once a month to send an email, for example.

## What is a DNS?

If we know computers communicate via the Internet Protocol and communicate using IP Addresses, how do we turn google.com into the website we use so regularly?

The answer is using a Domain Name System (DNS). The job of the Domain Name System is to transform human readable domain names into IP addresses.

There are four servers specifically that we'll discuss.

### DNS Recursor

A **DNS Recursor** is like a waiter in a restaurant. It acts like a "front facing" part of the system to receive orders (normally from browsers) where the waiter then heads into the back to get what is needed.

In reality, it's just a server that receives DNS queries from browsers and returns information.

There are 3 different places the DNS recursor can generally get the information from depending on if any data has been cached:

- Root nameserver
- TLD nameserver
- Authoritative nameserver

#### What is a Root Nameserver?

The root nameserver's main job is to return the Top-Level Domain (TLD) server.

This is an important step to map hostnames into IP addresses.

The root nameserver essentially acts like a catalogue that points to more specific locations.

#### What is a Top-Level Domain (TLD) Server?

If the root nameserver acts like a catalogue, the TLD server acts like a page in a catalogue.

The TLD server generally returns the final part of the host-name, like com for example, in "google.com".

#### What is an Authoritative Nameserver?

This server is like a row entry on the specific page of the catalogue.

The authoritative nameserver now can return the IP address for the requested hostname from the browser, back to the DNS recursor – which can hand it back to the browser.

**Example Request**

<div style="text-align: center;">
  <img src="https://www.freecodecamp.org/news/content/images/2023/07/image-168.png">
</div>

**Ref:** https://www.freecodecamp.org/news/what-is-dns-for-beginners/

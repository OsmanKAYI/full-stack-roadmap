# What is IPv4 and IPv6

- The Internet Protocol (IP) is one of the most important communication protocols in the Internet Protocol Suite (IPS), which is used for routing and addressing packets for networking devices such as computers, laptops and fiber switches across a single network or a series of interconnected networks.
- An IP (Internet Protocol) address is a numerical label assigned to each device connected to a computer network that uses the IP protocol for communication. An IP address acts as an identifier for a specific device on a particular network. The IP address is also called an IP number or Internet address.
- IP address specifies the technical format of the addressing and packets scheme. Most networks combine IP with a TCP (Transmission Control Protocol). It also allows developing a virtual connection between a destination and a source.
- There are currently two versions of Internet Protocol: IPv4 (IP version 4) and IPv6 (IP version 6). What do IPv4 and IPv6 mean?

## What is IPv4?

IPv4 is an IP version widely used to identify devices on a network using an addressing system. It was the first version of IP deployed for production in the ARPANET in 1983. It uses a 32-bit address scheme to store 2^32 addresses which is more than 4 billion addresses. It is considered the primary Internet Protocol and carries 94% of Internet traffic.

## Features of IPv4

- Connectionless Protocol
- Allow creating a simple virtual communication layer over diversified devices
- It requires less memory, and ease of remembering addresses
- Already supported protocol by millions of devices
- Offers video libraries and conferences

## What is IPv6?

IPv6 is the most recent version of the Internet Protocol. This new IP address version is being deployed to fulfill the need for more Internet addresses. It was aimed to resolve issues that are associated with IPv4. With 128-bit address space, it allows 340 undecillion unique address space. IPv6 is also called IPng (Internet Protocol next generation).

## Features of IPv6

- Hierarchical addressing and routing infrastructure
- Stateful and Stateless configuration
- Support for quality of service (QoS)
- An ideal protocol for neighboring node interaction

* Both IP addresses are used to identify machines connected to a network. In principle, they are almost similar, but they are different in how they work.

## Key Differences between IPv4 and IPv6

- IPv4 is a 32-Bit IP address, whereas IPv6 is a 128-Bit IP address.
- IPv4 is a numeric addressing method, whereas IPv6 is an alphanumeric addressing method.
- IPv4 binary bits are separated by a dot(.), whereas IPv6 binary bits are separated by a colon ':'.
- IPv4 offers 12 header fields, whereas IPv6 offers 8 header fields.
- IPv4 supports broadcast, whereas IPv6 doesn’t support broadcast.
- IPv4 has checksum fields while IPv6 doesn’t have checksum fields

  - A **checksum** is a value that represents the number of bits in a transmission message and is used by IT professionals to detect high-level errors within data transmissions. Prior to transmission, every piece of data or file can be assigned a checksum value after running a cryptographic hash function.

- When we compare IPv4 and IPv6, IPv4 supports VLSM (Variable Length Subnet Mask), whereas IPv6 doesn’t support VLSM.

  - **VLSM (Variable Length Subnet Mask)** is a technique that allows network administrators to divide an IP address space into subnets of different sizes, rather than dividing it into subnets of the same size. This allows for more efficient use of IP addresses, as smaller subnets can be used for smaller networks, and larger subnets can be used for larger networks.
  - _For example_, if a network administrator is given a Class C IP address space of 192.168.1.0/24, they can use VLSM to divide it into two subnets: one with a /25 mask for a smaller network, and one with a /26 mask for a larger network. The smaller network would have 128 host addresses, and the larger network would have 64 host addresses.
  - This allows the administrator to assign IP addresses more efficiently, as they can use the larger subnet for a network that needs more IP addresses and the smaller subnet for a network that needs fewer IP addresses.

- IPv4 uses ARP (Address Resolution Protocol) to map to MAC address, whereas IPv6 uses NDP (Neighbour Discovery Protocol) to map to MAC address.
  - Address Resolution Protocol (ARP) is a protocol or procedure that connects an ever-changing Internet Protocol (IP) address to a fixed physical machine address, also known as a media access control (MAC) address, in a local-area network (LAN).

**IPv4 and IPv6 Examples**

| IPv4            | IPv6                                    |
| --------------- | --------------------------------------- |
| 127.255.255.255 | 2001:0db8:85a3:0000:0000:8a2e:0370:7334 |

- IPv4 and IPv6 cannot communicate with other but can exist together on the same network. This is known as Dual Stack.

**Ref:** https://www.guru99.com/difference-ipv4-vs-ipv6.html#:~:text=IPv4%20is%20a%2032%2DBit,IPv6%20offers%208%20header%20fields

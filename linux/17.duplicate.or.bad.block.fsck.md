# Linux Blank Screen While Opening (Manual fsck Required)

- If you faced with the problem of **Manual fsck Required** and see a [blank screen](./img/manual.fsck.required.jpg).
- The root filesystem on /dev/$part requires a manual fsck where $part is the problemetic part of the disk in the system.

```BASH
# from there, you should be able to drop to some maintenance shell (if not already opened)
fsck -yf /dev/$part
#if there are any errors rerun the command above

# login as usual
exit
# and proceed normally
```

**Ref:** https://askubuntu.com/questions/885062/root-file-system-requires-manual-fsck

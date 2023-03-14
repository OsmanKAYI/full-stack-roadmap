# What are Hard Links?

Quick definition: In the Linux operating system, a hard link is equivalent to a file stored in the hard drive – and it actually references or points to a spot on a hard drive. A hard link is a mirror copy of the original file. The distinguishing characteristic of a hard link from a soft link is that deleting the original file doesn't affect a hard link, while it renders a soft link inoperable.

# What are Soft Links?

Quick definition: In Linux, a soft link, also known as a symbolic link, is a special sort of file that points at a different file. In Windows vocabulary, you could think of it like a shortcut. Because the connection is a logical one, and not a duplication, soft links can point at entire directories or link to files on remote computers. Hard links cannot do this.

## How are Hard Links and Soft Links Different?

Hard links and soft links are terms used in Linux and OS10 operating systems. Both soft links and hard links point to files, but there's a key difference between them. The difference comes down to what they're referencing: hard links refer to the data itself, soft links point to the path to the data.

Understanding the difference between a hard link and a soft link takes zooming in on a hard drive as far down as we can go. In Linux systems, the data structure that does the actual storing of information is called an Inode. A hard link is a file all its own, and the file references or points to the exact spot on a hard drive where the Inode stores the data. A soft link isn't a separate file, it points to the name of the original file, rather than to a spot on the hard drive.

## How Do You Create Hard Links in Linux?

Now that we've got a conceptual understanding of hard links and soft links, let's get into a tangible understanding of them. If you have access to a Linux command line, we're going to walk through the commands for creating hard links and soft links. After we've created one of each, you'll probably see they're not terribly confusing once you see what's actually going on.

We're going to walk through a hypothetical file structure on our Ubuntu system. We start by opening up a terminal window, and looking at the files in our directory:
`ls`

Now, in our case, we can imagine we have just one file in that directory: file1.txt. We can display the contents of it by typing:
`cat file1.txt`

This will show us the contents of file1.txt. In our hypothetical set-up, we've created a text file that reads, "This is a regular file."

The first thing we want to do is create a hard link to file1.txt. To do that, we'll use the "ln" command. It'll read "ln", followed by the source file ( file1.txt) and what we want to name the second, hard-linked file. We'll call it "hardlink.txt":
`ln file1.txt hardlink.txt`

When you hit enter, you'll get no feedback. But, type:
`ls -l`

This will show that there are now two files in the directory. The original file, file1.txt is still there. And this readout shows us that it's 23 bytes. But we also have a new file here. It behaves and looks exactly like file1, but it's named hardlink.txt. It's also taking up 23 bytes. Why does it also have the exact same bytes? Because it's pointing to the same point on the hard drive.

Let's now take a look at what "pointing to the same point on the hard drive" means in practice. Let's edit hardlink.txt by typing:
`vim hardlink.txt`

That will open hardlink.txt for editing, and we'll see that it still reads what file1.txt read: "This is a regular file." The same file, the same data. We'll go into that text and edit it so that the file now reads, "This is a hardlinked file."

After we save it and close our editor, if we type:
`cat file1.txt`

We'll see the content of our original file1.txt. We'll see that the text has changed. Up above, we saw that it read "This is a regular file". But now we changed the same file (file1.txt) and because we made a change to hardlink.txt, the data on the underlying hard drive changed. Now both of them reference a chunk of text on the hard drive that says "This is a hardlinked file".

The best part of all of this is that if we delete file1.txt, our original file, we can still look at the contents of hardlink.txt. Because hardlink.txt is still pointing to the spot on the hard drive where the data is stored, deleting a different file that points to the same spot on the hard drive doesn't delete hardlink.txt.

To delete file1.txt, we'll type:
`rm file1.txt`

To see what this has done, we'll once again type:
`ls`

And now in our directory that had previously held two files, there's just the one: hardlink.txt.

## How Do You Make Soft Links in Linux?

Still working in our hypothetical file directory, we'll now demonstrate how soft links function. It's always a good idea to start with a blank slate, so we'll type:
`clear`

With a blank screen, let's get a look at our directory and files in it by typing:
`ls`

In here, we see hardlink.txt. Now, to create a soft or symbolic link to that file, we'll use the same ln command we used earlier, but this time we'll add "-s" for soft (or symbolic). The syntax is otherwise the same, we specify our source file, which is now hardlink.txt, as we deleted file1.txt, and the name of the new file, which we'll call softlink.txt:
`ln -s hardlink.txt softlink.txt`

Again, we get no feedback here. But we can see the results of our copying by typing:
`ls -l`

In this view, we'll see something interesting. There are two entries. One for "hardlink.txt", and one for "softlink.txt -> hardlink.txt". What that means is that our original file, hardlink.txt, is still pointing at the hard drive at the spot on the hard drive where the data is stored. However, softlink.txt isn't pointing at the hard drive. It's just pointing to the filename hardlink.txt.

Now, if we were to type:
`cat softlink.txt`

What would it show us? The contents of hardlink.txt. Because softlink.txt is soft linked to the file called hardlink.txt.

So, soft links have different qualities, and they're smaller than a hard link. But delete what they point at and we get problems. We can remove hardlink.txt by typing:
`rm hardlink.txt`

After removing hardlink.txt, let's look at what remains by typing:
`ls -l`

Not only is hardlink.txt missing, but we're getting red errors. The only return is softlink.txt -> hardlink.txt, but both of them are in red. That's the command line's way of telling us "Okay, softlink.txt is pointing to the file called hardlink.txt, but that file doesn't exist. So something is broken". We can go even further by typing:
`cat softlink.txt`

We get told that there is "No such file or directory." This might seem confusing at first, because what it's telling us is that there's no such file or directory as "softlink.txt". But what that translates to is that softlink.txt is failing to point us to an existing file or directory.

And that's the central difference between a hard link and a soft link: since the soft link doesn't point to the hard drive location, it just points to a filename, we've lost that data.

### Wrapping Up

In the end, the difference between hard links and soft links is pretty simple. Hard links are more forgiving when you delete a file, soft links take up less data because it's just pointing the way. However, soft links don't store the actual data, they just store the location of the original file. Delete that, and you've lost the information.

**Ref:** https://www.cbtnuggets.com/blog/certifications/open-source/linux-hard-links-versus-soft-links-explained

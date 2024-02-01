# Create New User and Delete the Old One

To change the username on Ubuntu, you'll need to create a new user with the desired username, give it the necessary permissions, and then optionally delete the old user. Here are the general steps:

**1. Create a New User:**

- Open a terminal and run the following command to create a new user. Replace "newusername" with the desired username.

```bash
sudo adduser newusername
```

- Follow the prompts to set a password and other information.

**2. Add the New User to sudo Group:**

- If you want the new user to have administrative privileges (sudo access), add them to the sudo group.

```bash
sudo usermod -aG sudo newusername
```

**3. Log Out:**

- Log out of the current session.

**4. Log In with the New User:**

- Log in with the new username and password.

**5. Optional: Change Home Directory Name:**

- If you also want to change the home directory name, you can do so, but be cautious and make sure you update any references to the old home directory.

```bash
sudo usermod -d /home/newusername -m newusername
```

**6. Verify and Update Permissions:**

- Verify that the new user has the appropriate permissions and ownership for their home directory.

```bash
sudo chown -R newusername:newusername /home/newusername
```

**7. Optional: Delete the Old User (Backup First):**

- Before deleting the old user, make sure to back up any important data associated with that user. If you're sure, you can delete the old user.

```bash
sudo deluser oldusername
```

This command removes the user but leaves the home directory untouched. If you want to remove the home directory as well, use:

```bash
sudo deluser --remove-home oldusername
```

Remember to replace "newusername" and "oldusername" with the actual new and old usernames.

After completing these steps, you should have successfully changed the username on Ubuntu. Keep in mind that changing usernames can have implications on file ownership and permissions, so make sure to check and update them accordingly.

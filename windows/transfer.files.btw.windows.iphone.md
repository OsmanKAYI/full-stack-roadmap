# Transfer Files Between Windows PC and iPhone Bidirectionally

## In Windows

- Press `Windows` button and type "cmd" and run `Command Prompt` as administrator.
- `net user "username" "password" /add` command lets you to create a new user with password.

**NOTE:** `net user "username" newpass` command lets you to change the password of an existed user when you start the **Windows Command Processor** as an administrator.
**NOTE:** `net user "username" /delete` command lets you to delete an existed user.

- Create a folder in any place on your computer.
- Right click the folder and press `Properties` and go to `sharing` tab.
- Click on `Share` button and expand the navbar.
- Select `username` and click on `Add` with permission level of `read/write`.
- Click on `Share` and `Done`.
- Go to `Advance Sharing`.
- Check the bar `Share this folder` and click into `Permissions`, down below.
- Click on `Add` and enter the `username` under the title of `Enter the object names to select`.
- Press on `Check Names` and `OK`.
- For the `Permissions for transfer`, check the box of `Full Control` under the name `Allow` which will allows you to transfer files bidirectionally.
- Click on `Apply` and `OK` in sequence, two times, and press `Close`.
- `ipconfig | find "IPv4"` command gives you the IP adress of your computer.

## In iPhone

- Go to the `Files`.
- In right-hand corner, click on the ellipsis and `Connect to Server`.
- Set server name as IP adress of your computer and click `Connect`.
- Connect as `Registered User` and set name as `username` and enter the password determined previously. And click on `Next`.
- The conection is done which means you can use the created folder in your computer and phone to send and get files.

**Ref:** <https://www.youtube.com/watch?v=4QkmEVkMHKc>

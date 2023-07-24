# How To Get Photos on GooglePhotos To Local

## gphotos-sync Installation

gphotos-sync is a command line python application that uses the Google Photos API. Installation is not very complex since there is a pip package. First make sure you have pip installed:

```BASH
apt install python3-pip

# install gphotos-sync wih pip:
python3 -m pip install gphotos-sync

# export ~/.local/bin in PATH if you haven't already (that's where the executables for packages installed using pip3 are stored)
echo "export PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc

# run .bashrc for updated PATH
source ~/.bashrc
```

## Google API Authentication Setup

The gphotos-sync manual has an up to date version of these instructions. At the time of writing this article they were working, but with Google you can never be sure what happens and when stuff is deprecated.

- Start by going to [console.cloud.google.com](https://console.cloud.google.com/).
- Create a new project. Name and location don't matter (I've used _get-photos_).
- Go to [console.cloud.google.com/projectselector2/apis/library](https://console.cloud.google.com/projectselector2/apis/library), select your new project, then search for **Photos Library API**. Click the big blue **Enable** button.
- Go to [console.cloud.google.com/apis](https://console.cloud.google.com/apis/), select your project and go to **OAuth Consent Screen**. Select **External** and **CREATE**.
- Fill in a name (I've used _get-photos_) and email and click **Save**.
- In the menu bar, go to **Credentials**, **Create Credentials**, **OAuth ClientID**.
- Select type **Desktop Application** and give the client a name (I've used _get-photos-client_).
- You'll see a confirmation screen. Afterwards, use the **DOWNLOAD JSON** button to save the file as **client_secret.json**.
- Go to **OAuth Consent Screen** and under **Publishing Status | Testing**, click on **PUBLISH APP** and **CONFIRM**.

I saved it in my _~/Downloads_ folder and then moved it to the correct folder for gphotos-sync, creating it if it does not exist:

```BASH
mkdir -p ~/.config/gphotos-sync/
cp ~/Downloads/client_secret*.json ~/.config/gphotos-sync/client_secret.json
```

## gphotos-sync Usage

```BASH
# create a folder where your pictures are going to be synced to:
mkdir -p ~/gphotos-sync/

# also authorize the client, it will ask you the first time you sync:
gphotos-sync ~/gphotos-sync/ --progress
# 04-12 12:55:28 WARNING  gphotos-sync 3.1.2 2023-04-12 12:55:28.485621
# Please visit this URL to authorize this application: https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=636621971213-53d9gq8ohb5avnoqnqa1g8q89br2nfhi.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2F&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fphotoslibrary.readonly+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fphotoslibrary.sharing&state=6f96B8GNg5jQEpLe7q0j4vOBm9g4qu&access_type=offline
```

- Once you see the error message above, click on the link given in the error.
- On pop-up window, you will be asked to login your Google account.
- Then, login your account.
- After login, you might get an **Unverified** warning, which, in this case, is fine.
- Click on **Advanced** (which is on the bottom-left corner on the tab) and **Go to $projectname (unsafe)**.
  - Do not click on **GO BACK TO SECURITY** button.
- Click checkboxes and give permisions to the app.
- Click on **Continue** button.
  - At this point, your work is done on browser. You can close the tab (_The authentication flow has completed. You may close this window_).
- After this, you can start using the software.

Your pictures will be in **~/gphotos-sync/photos**.

The next time you sync, only new photos will be downloaded. The tool is not able to detect changed photos, due to API limitations, so changes will not be detected. It will also not delete local pictures.

**Ref:** https://unix.stackexchange.com/questions/711221/how-can-i-download-and-sync-my-google-photos-to-linux <br>
**Ref:** https://raymii.org/s/tutorials/Local_incremental_Google_Photos_backup_on_Ubuntu.html <br>
**Ref:** https://docs.google.com/document/d/1ck1679H8ifmZ_4eVbDeD_-jezIcZ-j6MlaNaeQiz7y0/edit <br>

## Usage Scenarios

For detailed usage informations, type **`gphotos-sync --help`**.

Some of the gphotos-sync features/options are as follows:

- Download all your images and videos from Google Photos, including those created automatically by Google Photos (animations, panoramas, movies, enhanced photos, or collages)
- Grab all new photos added to your Google Photos account since the previous sync

* Optionally only download and synchronize a single album (using `--album "ALBUM NAME"`)
* Compare the images in your Google Photos account with a local folder, like a previous backup. The comparison does not require that the files are arranged in the same folders, it uses meta-data in the files such as create date and exif UID to match pairs of items (use `--compare-folder "COMPARE_FOLDER"`)
* Delete the index database and re-scan everything (`--flush-index`)
* Optionally re-scan the entire library, ignoring the last scan date (`--rescan`)
* Check for the existence of files marked as already downloaded and re-download any missing ones. Use this if you have deleted some local files (`--retry-download`)
* Skip videos when syncing (`--skip-video`)
* Set the start and end date of the files to sync in the format YYYY-MM-DD (`--start-date START_DATE / --end-date END_DATE`)

### Dowload Latest Photos on Your Account

```BASH
gphotos-sync ~/gphotos-sync/$accountname/ --progress
```

### Dowload Photos on Your Account With Controlling Any Change

```BASH
gphotos-sync ~/gphotos-sync/$accountname/ --progress --rescan --retry-download
```

### Dowload Photos on Your Account Without Dates of Albums

```BASH
gphotos-sync ~/gphotos-sync/$accountname/ --progress --omit-album-date
```

### Dowload Photos on Your Account Without Albums

```BASH
gphotos-sync ~/gphotos-sync/$accountname/ --progress --skip-albums
```

**NOTE:** If you face any problem like `OSError: [Errno 98] Address already in use`, rearrange the command as follows:

```BASH
gphotos-sync ~/gphotos-sync/$accountname/ --progress --rescan --retry-download --skip-albums --port 8081
```

**Ref:** https://www.linuxuprising.com/2019/06/how-to-backup-google-photos-to-your.html

# Website Translation

To translate a website, I followed these successful & unsuccessful steps.

- Install the website using **wget**.
  - While doing that be careful about the links not to be broken.
- I have tried some ways to translate the downloaded website
  - Beautiful Soup 4 (BS4) which was not successful.
  - GoogleTranslate which is not free.
  - Deepl which is actually an efficient tool but has no access from Türkiye :'( so I could not get API Key.
  - LibreTranslate which is really slow and not accurate. I have configured and tested the API Key served by libreTranslate with Swagger UI but the results were poor.
  - Beautiful Soup 4 (BS4) which was not successful.
  - At the end I've used GTranslate which made me happy about the results I get.

Processes will be explained with details in the following.

## Download Website

```bash
wget -A html --random-wait --convert-links --adjust-extension --page-requisites --no-clobber --no-parent --no-check-certificate --level 1 -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:6.0a2) Gecko/20110613 Firefox/6.0a2" -r https://www.website.com/

# or simply
wget -mkEpnp --level 1 --no-check-certificate -r https://www.website.com/
```

## Copy Files to DirectAdmin (Client Server)

```bash
cd /path/of/downloaded/files/
scp -r ./* $username@$ip:/home/$username/domains/$domainname/public_html/
```

## Translate with GTranslate

1. You need to select your plan and subscribe [GTranslate](https://gtranslate.io/).
2. You will receive an email including username and password when you subscribe.
3. According to these informations login the dashboard.
4. In [**Setup Wizard**](https://my.gtranslate.io/setup-wizard), complete the steps according to your case (remember to choose _URL Structure_ and define _CNAME_ records properly in step 2).

### How to Set CNAME Records Properly in DirectAdmin

- To define your website as "tr.$domainname.com"
  - Go to the **DNS Management** page for $domainname
  - In the row which includes CNAME, set **Name** as "**tr**" and **Value** as "**sis.tdn.gtranslate.net.**"

5. Add the html file content (obtained at the end of step 3) in a proper place to your _index.html_ file.

**Sample html content to add flags and dropdown which will be added to index.html for Türkçe, English, and Hindi should be:**

```html
<!-- GTranslate: https://gtranslate.io/ -->
<a
  href="#"
  onclick="doGTranslate('en|en');return false;"
  title="English"
  class="gflag nturl"
  style="background-position:-0px -0px;"
  ><img
    src="//gtranslate.net/flags/blank.png"
    height="16"
    width="16"
    alt="English" /></a
><a
  href="#"
  onclick="doGTranslate('en|hi');return false;"
  title="Hindi"
  class="gflag nturl"
  style="background-position:-500px -100px;"
  ><img
    src="//gtranslate.net/flags/blank.png"
    height="16"
    width="16"
    alt="Hindi" /></a
><a
  href="#"
  onclick="doGTranslate('en|tr');return false;"
  title="Turkish"
  class="gflag nturl"
  style="background-position:-100px -500px;"
  ><img
    src="//gtranslate.net/flags/blank.png"
    height="16"
    width="16"
    alt="Turkish"
/></a>

<style type="text/css">
  <!--
  a.gflag {
    vertical-align: middle;
    font-size: 16px;
    padding: 1px 0;
    background-repeat: no-repeat;
    background-image: url(//gtranslate.net/flags/16.png);
  }

  a.gflag img {
    border: 0;
  }

  a.gflag:hover {
    background-image: url(//gtranslate.net/flags/16a.png);
  }
  -->
</style>

<br /><select onchange="doGTranslate(this);">
  <option value="">Select Language</option>
  <option value="en|en">English</option>
  <option value="en|hi">Hindi</option>
  <option value="en|tr">Turkish</option>
</select>

<script type="text/javascript">
  /* <![CDATA[ */
  function doGTranslate(lang_pair) {
    if (lang_pair.value) lang_pair = lang_pair.value;
    if (lang_pair == "") return;
    var lang = lang_pair.split("|")[1];
    var plang = location.hostname.split(".")[0];
    if (
      plang.length != 2 &&
      plang.toLowerCase() != "zh-cn" &&
      plang.toLowerCase() != "zh-tw"
    )
      plang = "en";
    location.href =
      location.protocol +
      "//" +
      (lang == "en" ? "" : lang + ".") +
      location.hostname
        .replace("www.", "")
        .replace(RegExp("^" + plang + "\\."), "") +
      location.pathname +
      location.search;
  }
  /* ]]> */
</script>
```

### How to Enable URL Translation

- To enable URL translation feature for your website you need to add the following code into the head tag of your pages and make sure it is on top of other tags inside head tag.

```html
<meta name="uri-translation" content="on" />
```

### How to Edit Translations

- In order to edit the translations you need to go to the language you want to edit and then add **?language_edit=1** to the URL. If you already have **?** in the URL you need to add **&language_edit=1** to the URL.
- For example to edit a text on home page in Türkçe language you need to go to **http://tr.$domainname.com/?language_edit=1** which will open the edit interface.

```html
<meta name="uri-translation" content="on" />
```

For more information, visit the [GTranslate's Documentation](https://gtranslate.io/docs/58-gtranslate-tdn-documentation)

## Translate with LibreTranslate (Free But Poor Results)

```bash
sudo apt install python3-pip -y
pip install libretranslate
reboot
libretranslate --host $IP --port 5000
# to find the value of $IP, run `ipconfig` command on your server.
# if you are using a virtual machine as a remote server, you need to go through "Settings | Network" and set the value of "Attached to:" as "Bridged Adapter" on VirtualBox App which will create an IP address of your virtual machine from your DHCP source. Then, press "OK".
# at the end, you will be able to connect from your local computer in browser with "$IP:5000"
```

```bash
# check the connection on client server
telnet $IP $port
# if the result is 'connected' then there is no problem
```

**NOTE:** Downloaded files will be under `/tmp/libretranslate-files-translate` on client server.

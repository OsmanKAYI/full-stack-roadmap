# How to Mirror a Website

Site mirroring, also known as website mirroring or web mirroring, refers to the process of creating a duplicate or mirror image of an entire website or a portion of it. The purpose of site mirroring is to make an exact replica of a website so that it can be accessed even if the original website is down or offline.

Site mirroring can be used for various purposes, including backing up websites, accessing websites with poor connectivity or limited access, and preserving historical versions of websites for research or archival purposes. However, it is important to note that some website owners may not allow their websites to be mirrored, so it is essential to check the website's terms of service before attempting to mirror it.

`wget --wait=1 --mirror --no-check-certificate --level 1 -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:6.0a2) Gecko/20110613 Firefox/6.0a2" --base=https://www.koderhq.com/ --adjust-extension --page-requisites --continue https://www.koderhq.com/`

## Definitions

- **--adjust-extension** is an option to automatically correct file extensions during a complete download of a website with the wget command. This option can be useful in cases where the extensions of the downloaded files are incorrect. **For example** a JPEG image file on a website can be viewed with a URL like example.com/image without the extension specified. In this case, when downloaded by the wget command, the name of the file is saved as image and no file extension is specified. Therefore, using the --adjust-extension option will automatically add the .jpg extension, which is the actual extension of the file.
- **--page-requisites** is an option for downloading all files (CSS, JavaScript, image files, etc.) on the page while downloading an entire web page with the wget command. This option is required so that the entire page can be used offline.
- **--no-parent** is an option during a complete download of a website with the wget command, which allows to only act on the starting URL instead of going to the parent folder. This option only downloads the content of the specified URL and does not go to other links. The --no-parent option is useful when you want to download a specific part of a website. This option makes the download process faster and more organized.
- **--no-check-certificate**, when downloading a file from a protected website using an SSL/TLS certificate with the wget command, instead of checking the validity of the certificate, it downloads directly. This option is useful when an error occurs with certificates or when you do not want certificates to be automatically validated.
- **--level** is used to download from a website to a certain depth with the wget command. This option downloads all pages linked to the specified web page and all links up to the specified depth.
- **--no-clobber** prevents the downloaded files from being overwritten when downloading with the wget command.
- **--continue**, when downloading files with the wget command, allows the download to continue from where it left off, even if it is interrupted. This option is especially useful if downloading large files is interrupted due to disconnections or network problems.

#### _--mirror_ Contains the Options Below

- -r (or --recursive): Downloads all subpages, images, videos and other resources on the website.
- -p (or --page-requisites): When creating a local copy of the web page, it downloads all the resources (images, style sheets, JavaScript files, etc.) needed to view the page.
- -nH (or --no-host-directories): Prevents the hostname from appearing in the destination directories of downloaded files.
- -k (or --convert-links): Automatically fix links in downloaded HTML files, thus making them available in local copy.
- -E (or --adjust-extension): Edit the extensions of the downloaded files in the local copy.
- -np (or --no-parent): Prevents parenting. This option is useful when you want to download only one of the subdirectories on a website.
- --reject and --accept: Options to download or not download certain types of files.

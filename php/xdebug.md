# Xdebug Configuration for VSCode

### Step 0: Install Xdebug

- Follow [Install Xdebug](../linux/setup.necessary.features.on.linux.md#xdebug) page for instructions.

### Step 1: Install Xdebug Extension in VSCode

- Download [PHP Debug extension](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug).

### Step 2:

- Press the `Run and Debug` button being on the left side in VSCode.
- Click on `create a launch.json file`.
- At the end, `launch.json` file content is

```JSON
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 0,
            "runtimeArgs": [
                "-dxdebug.start_with_request=yes"
            ],
            "env": {
                "XDEBUG_MODE": "debug,develop",
                "XDEBUG_CONFIG": "client_port=${port}"
            }
        },
        {
            "name": "Launch Built-in web server",
            "type": "php",
            "request": "launch",
            "runtimeArgs": [
                "-dxdebug.mode=debug",
                "-dxdebug.start_with_request=yes",
                "-S",
                "localhost:0"
            ],
            "program": "",
            "cwd": "${workspaceRoot}",
            "port": 9003,
            "serverReadyAction": {
                "pattern": "Development Server \\(http://localhost:([0-9]+)\\) started",
                "uriFormat": "http://localhost:%s",
                "action": "openExternally"
            }
        }
    ]
}
```

- These settings are needed for Xdebug to be run in VSCode.
  - To start project and debugging, choose the option of **Listen for Xdebug**.
  - To debug, add some breakpoints on your code and go on.

### Optional

- To see and check the browser version of php and Xdebug, `phpinfo.php` file content should be

```php
<?php
phpinfo();
xdebug_info();
```

- [Download the firefox extension](https://addons.mozilla.org/en-GB/firefox/addon/xdebug-helper-for-firefox/)

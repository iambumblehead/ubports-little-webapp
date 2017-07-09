### The Ubports Little Webapp

[Ubports][4] is a mobile operating system that does not collect personal data. It looks beautiful and is easy to use :). My favorite.

Here, I'll share what's needed to package and install an html/js app as a "click" package for Ubports. Download this little demo app and follow along to create a .click package with it.

It does not use electron or node-webkit, but uses a web container provided by the Ubports system.

#### Get started

![scrounge](https://github.com/iambumblehead/ubports-little-webapp/raw/master/src/img/browser-123.png)

First, download or clone the app and visit it with a shell. Use npm to install and run it locally and to see it in your browser.

```bash
$ npm install
$ npm start # after express starts, use a browser to visit http://localhost:3000/
```

It runs! You should see a scripted alert box. Most webapps are developed around a local service such as this, where changes can be seen in the browser.

#### Make a .click package!

![scrounge](https://github.com/iambumblehead/ubports-little-webapp/raw/master/src/img/click-123.png)

Now you're ready to make a .click package. Call the included `makeclick.sh` script. This script can be customised along with the boilerplate files found in ./platform/click.

```bash
$ bash ./makeclick.sh
[...] generate .click: ubports-little-webapp-1.0.0
[...] clean sources
[...] write sources
[...] write manifest version
[...] write click
Now executing: click-review ./ubports-little-webapp_1.0.0_all.click
./ubports-little-webapp_1.0.0_all.click: pass
Successfully built package in './ubports-little-webapp_1.0.0_all.click'.
```

#### Test a .click package!

One of the best ways to test your .click package is to install it on a device.
[Install adb][0] if you haven't done that already, then turn on your device and usb-connect it. Be sure "Developer mode" is enabled (System Settings > About > Developer mode).

```bash
$ adb push ubports-little-webapp_1.0.0_all.click /tmp # copy to the device
$ adb shell # enter the device
$ pkcon install-local --allow-untrusted /tmp/ubports-little-webapp_1.0.0_all.click # install
Installing files              [=========================]
Finished                      [=========================]
Installing files              [=========================]
Testing changes               [=========================]
Starting                      [=========================]
Finished                      [=========================]
Installed   	ubports-little-webapp-1.0.0.all
```

Refresh your homescreen and click the ubports icon to start the app!

![scrounge](https://github.com/iambumblehead/ubports-little-webapp/raw/master/src/img/flow-123.png)


<!--
What about .snap packages?

Included with the repo, is a script named makesnap.sh that generates a .snap package. I've never succesfully generated a working snap file :S

I've followed various guides and installed overlays and linked various libraries. Maybe in the future I will find a way to generate an html snap...
-->


Credit:

* Alan Pope's click package [blog entry][2]


![scrounge](https://github.com/iambumblehead/scroungejs/raw/master/img/hand.png)


[0]: https://www.linuxbabe.com/ubuntu/how-to-install-adb-fastboot-ubuntu-16-04-16-10-14-04
[1]: http://www.linuxuk.org/post/20160518_snapping_electron_based_applications_simplenote/
[2]: https://popey.com/blog/posts/2015/07/28/easily-port-mobile-html5-games-to-ubuntu-phone.html
[3]: https://en.wikipedia.org/wiki/Snappy_(package_manager)
[4]: https://ubports.com/ "ubports"

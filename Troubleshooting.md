*Issue*

After uninstalling the app being developed (i.e. in debug mode), and updating Android Studio, the app would no longer launch on the physical Android device.

It would get stuck at installing apk.

I tried deleting the gradle cache (`C:/Users/Harman/.gradle/cache`), reinstalling Flutter, reinstalling Android Studio, etc.

Ultimately, it was fixed by running:

```
 .\adb.exe uninstall co.appbrewery.bmicalculator
```
in `C:\Users\Harman\AppData\Local\Android\Sdk\platform-tools\`, while the device was connected with USB debugging enabled.

Note, that the device must appear to `adb`:

```
> .\adb.exe devices
List of devices attached
<id>        device
```
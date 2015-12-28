# Hill Climbing Racing Ad Clicker
This project is a bash script that automates the process of clicking ads on the [Hill Climbing Racing](https://play.google.com/store/apps/details?id=com.fingersoft.hillclimb) game so that more money are gained. You do not need to root your device, you only need to enable the developer mode on your Android device and install the [adb tool](http://developer.android.com/tools/help/adb.html) on your Linux or Mac OS system.

## Prerequisites
 - Your device should remain active for at least 1 minute before sleeping.
 - Your device should be placed in landscape mode. Preferably your earphone should be on the left.
 - The tap/swipe coordinates differ from device to device due to screen variety. For that reason you should override the `config.var` supplied with the actual coordinates that apply for your device. To help you detect the right coordinates it is recommended to check the "Pointer location" option on Developer settings.

 ## How to run
  - Connect your device on your computer, via a USB cable.
  - Simply run `./run.sh`. Don't forget to set execution permissions on that file (i.e. `chmod 744 run.sh`).
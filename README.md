# zetexa_practical

Qr code scanner integration

for scanning QR code 

SETUP for camera permission and QR scanner package
1. add camera permission 
2. setup permission to android. add permission to android/app/menifest.xml  <uses-permission android:name="android.permission.CAMERA" />
3. set up IOS permission in ios/Runner/info.plist
   <key>io.flutter.embedded_views_preview</key>
   <true/>
   <key>NSCameraUsageDescription</key>
   <string>This app needs camera access to scan QR codes</string>
4. integrated package is OLD so android version needs some changes in native setup .
    1.Setup android gradle version kotlin version and gradle distribution URL according to below.
        [settings.gradle](android%2Fsettings.gradle) 
        [build.gradle](android%2Fbuild.gradle) 
        [build.gradle](android%2Fapp%2Fbuild.gradle) 
        [gradle-wrapper.properties](android%2Fgradle%2Fwrapper%2Fgradle-wrapper.properties)
         
        JAVA version 1.8 is requried to setup;




approach for QR Scanner
 first camera related permission needs to be handled . after permission module QR scanner widget is integrated in Screen as provided by package.
after that QR scan listen method is handled once camera load event is triggred from package.
when camera found any qr code a Scanbar with the content found in QR is showed.


approach for QR generator

first input  box is used to get input to generate QR code . 
after that validation is integrated for the relevant input box. and validation is handled on generate qr button click.

after successfully submission of content QR is generated and displyed inside Dialog.

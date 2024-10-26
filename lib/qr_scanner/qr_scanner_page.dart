import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:zetexa_practical/core/permission_helper.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  GlobalKey globalKey = GlobalKey(debugLabel: 'qr-code');
  QRViewController? qrViewController;
  bool camemaPermission = false;
  String errorMessag = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        //check camera permission
        var permission = await PermissionHelper().requestCameraPermission();

        setState(() {
          camemaPermission = permission;
        });
      } on Exception catch (e) {
        //handle error if permission is not given by user
        errorMessag = e.toString();
      }
    });
  }

  onQrScan(QRViewController controller) {
    log('QrScanned');

    controller.scannedDataStream.listen((event) {
      log('QrScanned ${event.code}');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Scan result : ${event.code}')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (camemaPermission)
            //QR scnner view
            Expanded(
              child: QRView(
                key: globalKey,
                overlay: QrScannerOverlayShape(
                  cutOutSize: 300,
                  borderColor:Colors.white,
                  borderRadius: 10,

                  overlayColor: Colors.black87.withOpacity(.5)
                ),
                onQRViewCreated: (p0) {
                  qrViewController = p0;
                  onQrScan(p0);
                },
              ),
            )
          else if (errorMessag.isNotEmpty)
            //handled error message
            Center(
              child: Text(errorMessag),
            )
          else
            Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    //camera state management for on activity pause
    if (Platform.isAndroid) {
      qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      qrViewController?.resumeCamera();
    }
  }

@override
  void dispose() {
// disposing controller
    qrViewController?.dispose();
    super.dispose();
  }
}

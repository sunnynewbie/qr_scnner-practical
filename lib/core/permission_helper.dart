import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  Future<bool> requestCameraPermission() async {
    ///checking camera permission
    var isPermissionEnble = await Permission.camera.isGranted;
    if (isPermissionEnble) {
      return isPermissionEnble;
    }

//requesting camera permission if is not enable . throws error if permission is not enable

    var status = await Permission.camera.request();
    if (status == PermissionStatus.denied ||
        status == PermissionStatus.permanentlyDenied) {
      throw Exception("Please allow camera permission");
    }
    return true;
  }
}

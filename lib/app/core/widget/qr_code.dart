import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CustomQrCode {
  CustomQrCode._();
  static Widget generateQrCode({required String qrText}) {
    return QrImageView(data: qrText, size: 250.w, version: QrVersions.auto);
  }
}

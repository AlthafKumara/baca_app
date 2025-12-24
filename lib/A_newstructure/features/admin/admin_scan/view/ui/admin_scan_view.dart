import 'package:baca_app/A_newstructure/features/admin/admin_scan/controllers/admin_scan_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AdminScanView extends GetView<AdminScanController> {
  const AdminScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Primary500,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColor.Neutral100,
            size: 24.w,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Scan Qr',
          style: AppTextStyle.heading5(
            color: AppColor.Neutral100,
            fontWeight: AppTextStyle.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: MobileScanner(
        fit: BoxFit.cover,

        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;

          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;

            if (code != null) {
              controller.handleQRCode(code);
              return;
            }
          }
        },
      ),
      bottomNavigationBar: Container(height: 50.h, color: AppColor.Primary500),
    );
  }
}

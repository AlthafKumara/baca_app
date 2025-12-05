import 'package:baca_app/app/core/color/app_color.dart';
import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:baca_app/app/core/widget/admin_bottom_nav.dart';
import 'package:baca_app/app/modules/admin/admin_profile/widget/admin_profile_body.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_profile_controller.dart';

class AdminProfileView extends GetView<AdminProfileController> {
  const AdminProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.Neutral100,
        title: Text(
          'Library',
          style: AppTextStyle.heading3(
            fontWeight: AppTextStyle.bold,
            color: AppColor.Neutral900,
          ),
        ),
      ),
      body: AdminProfileBody(),
      bottomNavigationBar: AdminCustomBottomNav(initialIndex: 2),
    );
  }
}

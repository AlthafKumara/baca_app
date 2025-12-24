import 'package:baca_app/A_newstructure/features/admin/admin_profile/view/components/admin_profile_body.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_text_style.dart';
import 'package:baca_app/A_newstructure/shared/widgets/admin_bottom_nav.dart';
import 'package:flutter/material.dart';

class AdminProfileView extends StatelessWidget {
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

import 'package:baca_app/A_laststructure/app/core/color/app_color.dart';
import 'package:baca_app/A_laststructure/app/core/font/app_text_style.dart';
import 'package:baca_app/A_laststructure/app/core/widget/bottom_nav.dart';
import 'package:baca_app/A_laststructure/app/modules/user/profile/widget/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
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
      body: ProfileBody(),
      bottomNavigationBar: CustomBottomNav(initialindex: 3),
    );
  }
}

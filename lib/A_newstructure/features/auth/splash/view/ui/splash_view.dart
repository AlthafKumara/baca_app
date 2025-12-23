import 'package:baca_app/A_newstructure/constants/assets_constant.dart';
import 'package:baca_app/A_newstructure/features/auth/splash/controllers/splash_controller.dart';
import 'package:baca_app/A_newstructure/shared/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;
    return Scaffold(
      backgroundColor: AppColor.Neutral100,
      body: Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.Assets_logo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

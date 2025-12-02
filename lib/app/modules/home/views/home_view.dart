import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 26.w,
          height: 26.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Logo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Home View',
          style: AppTextStyle.heading2(
            color: Colors.amber,
            fontWeight: AppTextStyle.regular,
          ),
        ),
      ),
    );
  }
}

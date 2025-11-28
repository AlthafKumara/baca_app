import 'package:baca_app/app/core/font/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar("Snackbar", "Snackbar muncul");
        },
      ),
      appBar: AppBar(title: Text('HomeView'), centerTitle: true),
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

import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feed_controller.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FeedController>();
    return Scaffold(
      appBar: AppBar(title: const Text('FeedView'), centerTitle: true),
      body: const Center(
        child: Text('FeedView is working', style: TextStyle(fontSize: 20)),
      ),
      bottomNavigationBar: CustomBottomNav(initialindex: 1),
    );
  }
}

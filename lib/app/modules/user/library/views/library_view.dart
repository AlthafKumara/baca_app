import 'package:baca_app/app/core/widget/bottom_nav.dart';
import 'package:baca_app/app/modules/user/home/controllers/bottomnav_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/library_controller.dart';

class LibraryView extends StatelessWidget {
  LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LibraryController>();
    return Scaffold(
      appBar: AppBar(title: const Text('LibraryView'), centerTitle: true),
      body: const Center(
        child: Text('LibraryView is working', style: TextStyle(fontSize: 20)),
      ),
      bottomNavigationBar: CustomBottomNav(initialindex: 2),
    );
  }
}

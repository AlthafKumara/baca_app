import 'package:baca_app/A_newstructure/configs/pages/page.dart';
import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:baca_app/A_newstructure/utils/services/notification_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _handleTerminatedTap();
  }

  Future<void> _handleTerminatedTap() async {
    final message = await FirebaseMessaging.instance.getInitialMessage();
    if (message == null) return;

    // Tunggu GetMaterialApp selesai build dulu
    NotificationService.pendingNotificationData = message.data;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Library App",
          initialRoute: Routes.SPLASH,
          getPages: CustomPage.routes,
        );
      },
    );
  }
}

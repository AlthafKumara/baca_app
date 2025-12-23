import 'package:baca_app/A_newstructure/configs/pages/page.dart';
import 'package:baca_app/A_newstructure/configs/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

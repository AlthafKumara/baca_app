  import 'package:baca_app/my_app.dart';
  import 'package:flutter/material.dart';

  import 'package:get/get.dart';

  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:flutter_dotenv/flutter_dotenv.dart';
  import 'package:supabase_flutter/supabase_flutter.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );
    runApp(
      // NEW STRUCTURE
      MyApp(),

      // LAST STRUCTURE
      // ScreenUtilInit(
      //   designSize: Size(393, 852),
      //   builder: (_, child) {
      //     return GetMaterialApp(
      //       debugShowCheckedModeBanner: false,
      //       title: "Library App",
      //       initialRoute: Routes.SPLASH,
      //       getPages: AppPages.routes,
      //     );
      //   },
      // ),
    );
  }

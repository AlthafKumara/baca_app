import 'package:baca_app/A_newstructure/utils/services/notification_services.dart';
import 'package:baca_app/firebase_options.dart';
import 'package:baca_app/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final firebaseConfig = DefaultFirebaseOptions(
    apiKeyWeb: dotenv.env['FIREBASE_API_WEB']!,
    apiKeyIos: dotenv.env['FIREBASE_API_IOS']!,
    apiKeyAndroid: dotenv.env['FIREBASE_API_ANDROID']!,
    apiKeyWindows: dotenv.env['FIREBASE_API_WINDOWS']!,
    apiKeyMacos: dotenv.env['FIREBASE_API_MACOS']!,
  );

  await Firebase.initializeApp(options: firebaseConfig.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(onFCMBackground);

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    authOptions: const FlutterAuthClientOptions(autoRefreshToken: true),
  );

  await NotificationService.init();

  runApp(MyApp());
}

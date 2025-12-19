import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class CustomEnv {
  CustomEnv._();

  static final String baseUrl = dotenv.env['BASE_URL']!;
  static final String anonKey = dotenv.env['SUPABASE_ANON_KEY']!;
}

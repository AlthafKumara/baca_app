import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final supabase = Supabase.instance.client;

  Future<void> updateEmailPassword(String? email, String? password) async {
    try {
      if (email!.isEmpty && password!.isNotEmpty) {
        await supabase.auth.updateUser(UserAttributes(password: password));
      } else if (email.isNotEmpty && password!.isEmpty) {
        await supabase.auth.updateUser(UserAttributes(email: email));
      } else {
        await supabase.auth.updateUser(
          UserAttributes(email: email, password: password),
        );
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}

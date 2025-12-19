import 'package:supabase_flutter/supabase_flutter.dart';

class ExistingEmail {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<bool> checkExistingEmail(String email) async {
    final response = await supabase
        .from('profiles')
        .select()
        .eq('email', email)
        .maybeSingle();
    return response == null;
  }
}

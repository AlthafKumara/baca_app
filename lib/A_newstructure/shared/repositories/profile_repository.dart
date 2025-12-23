import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:baca_app/A_newstructure/shared/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepository {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> loadProfile() async {
    final user = supabase.auth.currentUser;
    final id = user?.id;

    if (id == null) {
      throw "User not found";
    }
    try {
      final profile = await supabase
          .from(ApiConstant.PROFILE)
          .select()
          .eq('id', id)
          .maybeSingle();

      if (profile == null) {
        throw "Profile not found";
      }

      return profile;
    } catch (e) {
      throw "Failed to load profile: $e";
    }
  }

  Future<List<ProfileModel>> getProfileById(List<String> userIds) async {
    try {
      final profile = await supabase
          .from('profiles')
          .select()
          .inFilter("id", userIds);
      return profile.map((e) => ProfileModel.fromMap(e)).toList();
    } catch (e) {
      throw "Failed to get profile: $e";
    }
  }
}

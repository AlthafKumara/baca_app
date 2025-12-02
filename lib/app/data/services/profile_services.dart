import 'dart:io';

import 'package:baca_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileServices {
  final supabase = Supabase.instance.client;

  Future<String?> uploadProfilePhoto(String userId, File file) async {
    try {
      final fileExt = file.path.split('.').last;
      final fileName = '$userId/profile.$fileExt';

      await supabase.storage
          .from('profile_photos')
          .upload(fileName, file, fileOptions: const FileOptions(upsert: true));

      final publicUrl = supabase.storage
          .from('profile_photos')
          .getPublicUrl(fileName);

      return publicUrl;
    } catch (e) {
      throw "Failed to upload image: $e";
    }
  }

  Future<void> createProfile({
    required String userId,
    required String email,
    required String fullName,
    required String gender,
    File? photoFile,
  }) async {
    try {
      String? photoUrl;

      if (photoFile != null) {
        photoUrl = await uploadProfilePhoto(userId, photoFile);
      }

      await supabase.from('profiles').insert({
        'id': userId,
        "email": email,
        'name': fullName,
        'gender': gender,
        'role': 'user',
        'photo_profile': photoUrl ?? '',
        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw "Failed to create profile: $e";
    }
  }
}

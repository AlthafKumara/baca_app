import 'dart:io';

import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CompleteProfileRepository {
  final supabase = Supabase.instance.client;

  Future<String?> uploadProfilePhoto(String userId, File file) async {
    try {
      final fileExt = file.path.split('.').last;
      final fileName = '$userId/profile.$fileExt';

      await supabase.storage
          .from(ApiConstant.PROFILE_PHOTO)
          .upload(fileName, file, fileOptions: const FileOptions(upsert: true));

      final publicUrl = supabase.storage
          .from(ApiConstant.PROFILE_PHOTO)
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

      await supabase.from(ApiConstant.PROFILE).insert({
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

import 'dart:io';

import 'package:baca_app/A_newstructure/constants/api_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddUpdateBookRepository {
  final supabase = Supabase.instance.client;

  Future<String?> uploadBookPhoto(String bookId, File file) async {
    try {
      final fileExt = file.path.split('.').last;
      final fileName = '$bookId.$fileExt';

      await supabase.storage
          .from('book_cover')
          .upload(fileName, file, fileOptions: const FileOptions(upsert: true));

      final publicUrl = supabase.storage
          .from('book_cover')
          .getPublicUrl(fileName);

      return publicUrl;
    } catch (e) {
      throw "Failed to upload image: $e";
    }
  }

  Future<void> createBook({
    required String title,
    required String author,

    required String description,
    required int categoryid,
    required int stock,
    File? photoFile,
  }) async {
    try {
      String? photoUrl;

      if (photoFile != null) {
        photoUrl = await uploadBookPhoto(title, photoFile);
      }

      await supabase.from(ApiConstant.BOOK).insert({
        'title': title,
        'author': author,
        'description': description,
        'stock': stock,
        'category': categoryid,
        'cover_url': photoUrl ?? '',

        'created_at': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw "Failed to create book: $e";
    }
  }

  Future<void> updateBook({
    required int id,
    required String title,
    required String author,
    required String description,
    required int categoryid,
    required int stock,
    File? photoFile,
    String? oldImageUrl,
  }) async {
    try {
      String? photoUrl = oldImageUrl;

      // Jika upload foto baru
      if (photoFile != null) {
        photoUrl = await uploadBookPhoto(title, photoFile);
      }

      await supabase
          .from(ApiConstant.BOOK)
          .update({
            'title': title,
            'author': author,
            'description': description,
            'stock': stock,
            'category': categoryid,
            'cover_url': photoUrl ?? '',
          })
          .eq('id', id);
    } catch (e) {
      throw "Failed to update book: $e";
    }
  }
}

import 'dart:io';

import 'package:baca_app/A_laststructure/app/data/model/book_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase/supabase.dart';

class BookServices {
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

      await supabase.from('book').insert({
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

  Future<List<Book>> getBook() async {
    final book = await supabase.from('book').select();

    final bookList = book.map((e) => Book.fromMap(e)).toList();

    return bookList;
  }

  Future<List<Book>> getBookFilterStatus() async {
    final book = await supabase
        .from('borrow')
        .select()
        .eq('status', 'OnBorrow');
    final bookList = book.map((e) => Book.fromMap(e)).toList();
    return bookList;
  }

  Future<List<Book>> getBookById(List<int> ids) async {
    final book = await supabase.from('book').select().inFilter('id', ids);

    return book.map((e) => Book.fromMap(e)).toList();
  }

  Future<void> deleteListBook(List<int> bookIds) async {
    try {
      await supabase.from('book').delete().inFilter('id', bookIds);
    } catch (e) {
      throw "Failed to delete book: $e";
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
          .from('book')
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

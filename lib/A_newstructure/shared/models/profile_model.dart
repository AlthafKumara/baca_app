import 'package:baca_app/A_newstructure/utils/enums/enum_helper.dart';
import 'package:baca_app/A_newstructure/utils/enums/profiles_enum.dart';

class ProfileModel {
  final String id;
  final String name;
  final Role role;
  final String email;
  final String? photoProfile;
  final String? gender;
  final DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    this.photoProfile,
    this.gender,
    required this.createdAt,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      name: map['name'],
      role: parseRole(map['role']),
      email: map['email'],
      photoProfile: map['photo_profile'],
      gender: map['gender'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'role': role.name,
      'email': email,
      'photo_profile': photoProfile,
      'gender': gender,
      'created_at': createdAt.toIso8601String(),
    };
  }
}

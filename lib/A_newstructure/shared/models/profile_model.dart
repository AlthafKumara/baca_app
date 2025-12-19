import 'package:baca_app/A_newstructure/utils/enums/profiles_enum.dart';

class Profile {
  final String id;
  final String name;
  final Role role;
  final String email;
  final String? photoProfile;
  final String? gender;
  final DateTime createdAt;

  Profile({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    this.photoProfile,
    this.gender,
    required this.createdAt,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      role: _parseRole(map['role']),
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

  static Role _parseRole(String? value) {
    if (value == null) return Role.user;
    return Role.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => Role.user,
    );
  }
}

import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: UserBottomNav(initialindex: 3));
  }
}

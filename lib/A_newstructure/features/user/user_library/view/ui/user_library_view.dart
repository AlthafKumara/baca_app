import 'package:baca_app/A_newstructure/shared/widgets/user_bottom_nav.dart';
import 'package:flutter/material.dart';

class UserLibraryView extends StatelessWidget {
  const UserLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: UserBottomNav(initialindex: 2));
  }
}

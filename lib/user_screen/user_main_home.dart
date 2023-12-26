import 'package:flutter/material.dart';
import 'package:homeworkout/user_screen/user_botttomnavigation.dart';

class UserMainHome extends StatelessWidget {
  const UserMainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: UserFluidbottom(),
      ),
    );
  }
}

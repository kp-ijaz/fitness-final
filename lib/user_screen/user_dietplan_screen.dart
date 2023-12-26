import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
// import 'package:homeworkout/screen/diet/breakfast.dart';
// import 'package:homeworkout/screen/diet/dinner.dart';
// import 'package:homeworkout/screen/diet/lunch.dart';
import 'package:homeworkout/user_screen/user_breakfast.dart';
import 'package:homeworkout/user_screen/user_dinner.dart';
import 'package:homeworkout/user_screen/user_lunch.dart';

class UserDietplan extends StatefulWidget {
  const UserDietplan({super.key});

  @override
  State<UserDietplan> createState() => _UserDietplanState();
}

class _UserDietplanState extends State<UserDietplan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_rounded)),
        title: const Text('7 DAYS DIET PLAN'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              ButtonsTabBar(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.amber,
                ),
                labelSpacing: 5,
                unselectedBackgroundColor: Colors.grey,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                buttonMargin: const EdgeInsets.symmetric(horizontal: 30),
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: 'BREAKFAST',
                  ),
                  Tab(
                    text: 'LUNCH',
                  ),
                  Tab(text: 'DINNER')
                ],
              ),
              const Expanded(
                  child: TabBarView(
                      children: [UserBreakfast(), UserLunch(), UserDinner()])),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/add_screen/add_diet.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
import 'package:homeworkout/screen/diet/breakfast.dart';
import 'package:homeworkout/screen/diet/dinner.dart';
import 'package:homeworkout/screen/diet/lunch.dart';

class Dietplan extends StatelessWidget {
  const Dietplan({super.key});

  @override
  Widget build(BuildContext context) {
    DietDB().refresh();
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => Add_diet())));
            },
            icon: Icon(
              Icons.add,
              size: 30,
            )),
      ),
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
                  child:
                      TabBarView(children: [Breakfast(), Lunch(), Dinner()])),
            ],
          ),
        ),
      ),
    );
  }
}

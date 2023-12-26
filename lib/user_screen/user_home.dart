import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/user_screen/sub-category.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/user_screen/user_dietpage.dart';
import 'package:homeworkout/user_screen/user_dietplan_screen.dart';
import 'package:homeworkout/user_screen/user_tips.dart';
import 'package:homeworkout/user_screen/yagawrkout.dart';

import '../db model/category/tips_db.dart';

class UserHom extends StatefulWidget {
  const UserHom({super.key});

  @override
  State<UserHom> createState() => _UserHomState();
}

class _UserHomState extends State<UserHom> {
  @override
  void initState() {
    CategoryDB().refreshUi();
    DietDB().refresh();
    TipsDB().refreshtips();
    // MessageDB().refreshMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          toolbarHeight: 75,
          titleSpacing: 8,
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 8),
            child: InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/fitnes9.png'),
                backgroundColor: Colors.transparent,
                radius: 5.0,
              ),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('Hii '),
                  Text(
                    'User',
                    style: TextStyle(color: Colors.amber),
                  ),
                ],
              ),
              Text(
                "Let's start your day",
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
          child: ListView(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your workouts',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 17),
                ),
                Text(
                  '6am - 8am',
                  style: TextStyle(color: Colors.amber, fontSize: 17),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: double.infinity,
                height: 170,
                child: GridView(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Usersubcategory_page(
                                    categorytype: CategoryType.withoutEqupment,
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/fitnes2.jpg')),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 134, 109, 18),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            'Without\nequipments',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => Usersubcategory_page(
                                  categorytype: CategoryType.gym,
                                )),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/fitnes3.1.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 175, 172, 161),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            'Gym\nWorkouts',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: ((context) => Yogawrkout())),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/fitnes3.4.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 221, 209, 163),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            'Yoga',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => Usertips(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/fitnes7.jpg')),
                          borderRadius: BorderRadius.circular(10)),
                      height: 110,
                      width: 110,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => Usertips()));
                      },
                      child: const Text(
                        'TIPS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const UserDietplan()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/fitnes6.png')),
                            borderRadius: BorderRadius.circular(10)),
                        height: 110,
                        width: 110,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const UserDietplan()));
                    },
                    child: const Text(
                      'DIET PLAN',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

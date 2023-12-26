import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/user_screen/user_gym_screen.dart';
import 'package:homeworkout/user_screen/user_without_screen.dart';

class Usersubcategory_page extends StatelessWidget {
  final CategoryType categorytype;
  const Usersubcategory_page({super.key, required this.categorytype});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CalendarAppBar(
          lastDate: DateTime.now(),
          onDateChanged: (value) => print(value),
          firstDate: DateTime.now().subtract(
            const Duration(days: 140),
          ),
          fullCalendar: true,
        ),
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'BEGINNER',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          categorytype == CategoryType.withoutEqupment
                              ? const UserWithoutScreen(
                                  heading: "Fullbody",
                                  level: Typelevel.beginner,
                                  workCategory: SubCategoryType.fullbody)
                              : const UserGymScreen(
                                  heading: "fullbody",
                                  level: Typelevel.beginner,
                                  workCategory: SubCategoryType.fullbody),
                    ),
                  );
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      'FULL BODY WORKOUTS\n',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.3),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return categorytype == CategoryType.withoutEqupment
                        ? const UserWithoutScreen(
                            heading: "Lowerbody",
                            level: Typelevel.beginner,
                            workCategory: SubCategoryType.lowerbody)
                        : const UserGymScreen(
                            heading: "Lowerbody",
                            level: Typelevel.beginner,
                            workCategory: SubCategoryType.lowerbody);
                  }));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text('LOWER BODY WORKOUTS\n',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, height: 1.3)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text('INTERMEDIATE',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return categorytype == CategoryType.withoutEqupment
                        ? const UserWithoutScreen(
                            heading: "Fullbody",
                            level: Typelevel.intermediate,
                            workCategory: SubCategoryType.fullbody)
                        : const UserGymScreen(
                            heading: "Fullbody",
                            level: Typelevel.intermediate,
                            workCategory: SubCategoryType.fullbody);
                  })));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      'FULL BODY WORKOUTS',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.3),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return categorytype == CategoryType.withoutEqupment
                        ? const UserWithoutScreen(
                            heading: "Lowerbody",
                            level: Typelevel.intermediate,
                            workCategory: SubCategoryType.lowerbody)
                        : const UserGymScreen(
                            heading: "Lowerbody",
                            level: Typelevel.intermediate,
                            workCategory: SubCategoryType.lowerbody);
                  })));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text('LOWER BODY WORKOUTS',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, height: 1.3)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Text('ADVANCED',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return categorytype == CategoryType.withoutEqupment
                        ? const UserWithoutScreen(
                            heading: "Fullbody",
                            level: Typelevel.advanced,
                            workCategory: SubCategoryType.fullbody)
                        : const UserGymScreen(
                            heading: "Fullbody",
                            level: Typelevel.advanced,
                            workCategory: SubCategoryType.fullbody);
                  })));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      'FULL BODY WORKOUTS',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, height: 1.3),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return categorytype == CategoryType.withoutEqupment
                        ? const UserWithoutScreen(
                            heading: "Lowerbody",
                            level: Typelevel.advanced,
                            workCategory: SubCategoryType.lowerbody)
                        : const UserGymScreen(
                            heading: "Lowerbody",
                            level: Typelevel.advanced,
                            workCategory: SubCategoryType.lowerbody);
                  })));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 175, 174, 170),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Text('LOWER BODY WORKOUTS',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, height: 1.3)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

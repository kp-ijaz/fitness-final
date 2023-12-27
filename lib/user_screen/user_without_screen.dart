import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/category/report_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/db%20model/report_model.dart';
import 'package:homeworkout/user_screen/countdown.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:homeworkout/user_screen/user_exercise_details_screen.dart';
import 'package:intl/intl.dart';

class UserWithoutScreen extends StatelessWidget {
  final String heading;
  final Typelevel level;
  final SubCategoryType workCategory;

  const UserWithoutScreen(
      {super.key,
      required this.heading,
      required this.level,
      required this.workCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        title: Text(heading),
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final value = newList[index];
                return value.leveltype.contains(level) &&
                        value.subtype == workCategory
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => UserExerciseDetails(
                                    name: value.name,
                                    description: value.description,
                                    image: value.image,
                                    timer: value.timer)));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: FileImage(File(value.image[0])),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.play_circle,
                                    size: 35, color: Colors.amber),
                                onPressed: () {
                                  print('=++++++++++++++++++++');
                                  var val = Reportmodal(
                                      id: DateFormat("yyyy-MM-dd")
                                          .format(DateTime.now()),
                                      time: [30]);
                                  ReportDB().addReport(val);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => CountdownTimerPage(
                                            level: level,
                                            image: value.image,
                                          )));
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container();
              },
              itemCount: newList.length);
        },
        valueListenable: CategoryDB().withoutListNotifier,
      ),
    );
  }
}

// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/user_screen/countdown.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:homeworkout/user_screen/user_exercise_details_screen.dart';

class UserGymScreen extends StatelessWidget {
  final String heading;
  final Typelevel level;
  final SubCategoryType workCategory;

  const UserGymScreen(
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
        title: const Text('Added Exercises'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<CategoryModel> newList1, Widget? _) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final _value1 = newList1[index];
                return _value1.leveltype.contains(level) &&
                        _value1.subtype == workCategory
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => UserExerciseDetails(
                                    name: _value1.name,
                                    description: _value1.description,
                                    image: _value1.image,
                                    timer: _value1.timer)));
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image:
                                            FileImage(File(_value1.image[0])),
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
                                      _value1.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.play_circle,
                                  size: 35,
                                  color: Colors.amber,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => CountdownTimerPage(
                                            level: level,
                                            image: _value1.image,
                                          )));
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    : Container();
              },
              itemCount: newList1.length);
        },
        valueListenable: CategoryDB().gymListNotifier,
      ),
    );
  }
}

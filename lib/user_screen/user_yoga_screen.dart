// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/user_screen/countdown.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:homeworkout/user_screen/user_exercise_details_screen.dart';

class UserYogaScreen extends StatelessWidget {
  final String heading;
  final Typelevel level;
  UserYogaScreen({super.key, required this.heading, required this.level});

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
        builder: (BuildContext ctx, List<CategoryModel> newList2, Widget? _) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                final _value2 = newList2[index];
                return _value2.leveltype.contains(level)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => UserExerciseDetails(
                                    timer: _value2.timer,
                                    name: _value2.name,
                                    description: _value2.description,
                                    image: _value2.image)));
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
                                            FileImage(File(_value2.image[0])),
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
                                      _value2.name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.play_circle,
                                          size: 35, color: Colors.amber),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    CountdownTimerPage(
                                                      level: level,
                                                      image: _value2.image,
                                                    )));
                                      },
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 30,
                              // )
                            ],
                          ),
                        ),
                      )
                    : Container();
              },
              itemCount: newList2.length);
        },
        valueListenable: CategoryDB().yogaListNotifier,
      ),
    );
  }
}

// import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:homeworkout/screen/screen_exercise_details.dart';
import 'package:homeworkout/screen/screen_update_exercise.dart';

class GymScreen extends StatelessWidget {
  final String heading;
  GymScreen({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        title: Text('Added Exercises'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<CategoryModel> newList1, Widget? _) {
          return SlidableAutoCloseBehavior(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final _value1 = newList1[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      key: const ValueKey(0),
                      startActionPane: ActionPane(
                        extentRatio: 0.2,
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (ctx) {
                              CategoryDB().deleteExercise(_value1.id!);
                            },
                            backgroundColor: const Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (ctx) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => AdminUpdateExercise(
                                        id: _value1.id as String,
                                        category: _value1.type,
                                        name: _value1.name,
                                        subtype: _value1.subtype,
                                        level: _value1.leveltype,
                                        image: _value1.image,
                                        description: _value1.description,
                                        timer: _value1.timer)));
                              },
                              backgroundColor: const Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                          ]),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ExerciseDetails(
                                  category: _value1.type,
                                  name: _value1.name,
                                  description: _value1.description,
                                  image: _value1.image,
                                  level: _value1.leveltype,
                                  subtype: _value1.subtype,
                                  timer: _value1.timer)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: FileImage(File(_value1.image[0])),
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
                                  const Icon(
                                    Icons.play_circle,
                                    size: 35,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: newList1.length),
          );
        },
        valueListenable: CategoryDB().gymListNotifier,
      ),
    );
  }
}

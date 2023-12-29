import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homeworkout/add_screen/add_exercise.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:homeworkout/screen/screen_exercise_details.dart';
import 'package:homeworkout/screen/screen_update_exercise.dart';

class Homeexecise extends StatelessWidget {
  final String heading;
  Homeexecise({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          title: const Text('Added Exercises'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ValueListenableBuilder(
          builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
            return SlidableAutoCloseBehavior(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final value = newList[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          extentRatio: 0.2,
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // onPressed: (ctx) {
                              //   CategoryDB().deleteExercise(value.id!);
                              // },
                              onPressed: (ctx) {
                                final result = showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'This action will permanently delete this data'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          CategoryDB()
                                              .deleteExercise(value.id!);
                                          Navigator.pop(context, true);
                                          CategoryDB().refreshUi();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );

                                // if (result == null || !result) {
                                //   return;
                                // }
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
                                          id: value.id as String,
                                          category: value.type,
                                          name: value.name,
                                          subtype: value.subtype,
                                          level: value.leveltype,
                                          image: value.image,
                                          description: value.description,
                                          timer: value.timer)));
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
                                    category: value.type,
                                    name: value.name,
                                    description: value.description,
                                    image: value.image,
                                    level: value.leveltype,
                                    subtype: value.subtype,
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
                  itemCount: newList.length),
            );
          },
          valueListenable: CategoryDB().withoutListNotifier,
        ),
      ),
    );
  }
}

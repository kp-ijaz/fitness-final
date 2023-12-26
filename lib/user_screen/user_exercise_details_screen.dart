import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';

class UserExerciseDetails extends StatelessWidget {
  String name;
  List<String> image;
  SubCategoryType? subcategory;
  String description;
  double timer;
  UserExerciseDetails(
      {super.key,
      required this.name,
      this.subcategory,
      required this.description,
      required this.image,
      required this.timer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Details of exercise',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: 350,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Card(
                        color: const Color.fromARGB(255, 3, 12, 44),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 380,
                            child: Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(image[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, _) => SizedBox(
                        width: 1,
                      ),
                  itemCount: image.length),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                name,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                description,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

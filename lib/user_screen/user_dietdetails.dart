import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/diet_model.dart';
// import 'package:homeworkout/screen/screen_update_diets.dart';
// import 'package:homeworkout/db/category/diet_db.dart';

class UserDietDetails extends StatefulWidget {
  DietType dietcategory;
  String name;
  String image;
  String description;
  String id;
  UserDietDetails(
      {super.key,
      required this.id,
      required this.dietcategory,
      required this.name,
      required this.image,
      required this.description});

  @override
  State<UserDietDetails> createState() => _UserDietDetailsState();
}

class _UserDietDetailsState extends State<UserDietDetails> {
  DietType? dietcategory;

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
            'Details of diet',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    height: 350,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: PhotoView(
                                  initialScale: PhotoViewComputedScale.covered,
                                  imageProvider: FileImage(File(widget.image)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/screen/diet.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/diet_model.dart';
import 'package:homeworkout/screen/screen_update_diets.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:homeworkout/db/category/diet_db.dart';

class DietDetails extends StatefulWidget {
  DietType dietcategory;
  String name;
  String image;
  String description;
  String id;
  DietDetails(
      {super.key,
      required this.id,
      required this.dietcategory,
      required this.name,
      required this.image,
      required this.description});

  @override
  State<DietDetails> createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {
  @override
  void initState() {
    DietDB().refresh();
  }

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
        body: ValueListenableBuilder(
          valueListenable: DietDB().breakfastListNotifier,
          // builder: (BuildContext ctx, List<DietModal> newlist, Widget? _) {
          builder: (BuildContext ctx, List<DietModal> newlist, _) {
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      initialScale:
                                          PhotoViewComputedScale.covered,
                                      imageProvider:
                                          FileImage(File(widget.image)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            widget.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Update_diet(
                                        id: widget.id,
                                        dietcategory: widget.dietcategory,
                                        name: widget.name,
                                        image: widget.image,
                                        description: widget.description)));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: const Icon(Icons.edit),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              // onPressed: () async {
                              //   await DietDB().deletediet(widget.id);
                              //   Navigator.of(context).pop();
                              //   Navigator.of(context).pop();
                              //   Navigator.of(context)
                              //       .push(MaterialPageRoute(builder: (ctx) {
                              //     return Dietplan();
                              //   }));
                              // },
                              onPressed: () {
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
                                        onPressed: () async {
                                          await DietDB().deletediet(widget.id);
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (ctx) {
                                            return const Dietplan();
                                          }));
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

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

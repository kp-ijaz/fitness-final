import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/diet_model.dart';
import 'package:homeworkout/screen/screen_diet_details.dart';

class Dinner extends StatelessWidget {
  const Dinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<DietModal> newList, Widget? _) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final _value1 = newList[index];
              return Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'DAY ${index + 1}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DietDetails(
                                id: _value1.id as String,
                                dietcategory: _value1.type,
                                name: _value1.dietname,
                                image: _value1.image,
                                description: _value1.description)));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 105,
                            width: 115,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: FileImage(File(_value1.image)),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            _value1.dietname,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: newList.length,
          );
        },
        valueListenable: DietDB().dinnerListNotifier,
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/user_screen/user_dietdetails.dart';

class UserBreakfast extends StatelessWidget {
  const UserBreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      body: ValueListenableBuilder(
        builder: (BuildContext ctx, List<DietModal> newlist, Widget? _) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final _value = newlist[index];
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
                            builder: (ctx) => UserDietDetails(
                                id: _value.id as String,
                                dietcategory: _value.type,
                                name: _value.dietname,
                                image: _value.image,
                                description: _value.description)));
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
                                    image: FileImage(File(_value.image)),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            _value.dietname,
                            style: const TextStyle(
                                height: 1.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: newlist.length,
          );
        },
        valueListenable: DietDB().breakfastListNotifier,
      ),
    );
  }
}

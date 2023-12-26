import 'dart:io';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/diet_model.dart';
import 'package:homeworkout/screen/screen_diet_details.dart';

class Breakfast extends StatelessWidget {
  const Breakfast({super.key});

  @override
  Widget build(BuildContext context) {
    // final breakfast = [
    //   'Oats,Banana,Pancakes\nwith Protein Shake',
    //   'Oatmeal with Greek Yogurt &\nSeasonal fruits Mango Juice',
    //   'Poached Eggs,Whole Grain Toast,\nProtein Shake',
    //   'Oatmeal with Honey\nApple Juice',
    //   'Scrambled Egg,Whole Grain Toast,\nSmoothie',
    //   'Oatmeal,Whole Grain Toast,\nOrange Juice',
    //   'Oatmeal with Nuts\nSmoothie'
    // ];

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
                            builder: (ctx) => DietDetails(
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

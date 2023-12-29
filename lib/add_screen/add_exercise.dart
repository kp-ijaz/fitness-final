import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
import 'package:homeworkout/db%20model/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

String? val;

class _AddExerciseState extends State<AddExercise> {
  CategoryType? _selectedCategory;
  final formKey = GlobalKey<FormState>();

  final _AddExercisecontroller = TextEditingController();
  SubCategoryType? _selectedSubCategory;
  bool _beginner = false;
  bool _intermediate = false;
  bool _advanced = false;
  String idtosent = '';
  int? msgidexercise;
  final _AddDescriptioncontroller = TextEditingController();
  double _currentDoubleValue = 1.0;
  final ImagePicker imagePicker = ImagePicker();
  List<String> imagefileList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          elevation: 0,
          title: const Text('Add Exercise'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: DropdownButtonFormField(
                      dropdownColor: const Color.fromARGB(255, 185, 181, 168),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      hint: const Text('Select the category',
                          style: TextStyle(
                              color: Color.fromARGB(174, 255, 255, 255))),
                      items: const [
                        DropdownMenuItem(
                          value: CategoryType.withoutEqupment,
                          child: Text('Without Equipments'),
                        ),
                        DropdownMenuItem(
                          value: CategoryType.gym,
                          child: Text('Gym Workouts'),
                        ),
                        DropdownMenuItem(
                          value: CategoryType.yoga,
                          child: Text('Yoga'),
                        )
                      ],
                      onChanged: (value) {
                        _selectedCategory = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the name';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    controller: _AddExercisecontroller,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(204, 255, 255, 255))),
                      label: Text(
                        'Enter the name of exercise',
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: DropdownButtonFormField(
                      dropdownColor: const Color.fromARGB(255, 185, 181, 168),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      hint: const Text('Select the sub-category',
                          style: TextStyle(
                              color: Color.fromARGB(174, 255, 255, 255))),
                      items: const [
                        DropdownMenuItem(
                          value: SubCategoryType.fullbody,
                          child: Text('FULL BODY WORKOUTS'),
                        ),
                        DropdownMenuItem(
                          value: SubCategoryType.lowerbody,
                          child: Text('LOWER BODY WORKOUTS'),
                        ),
                      ],
                      onChanged: (value) {
                        _selectedSubCategory = value;
                      }),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, right: 150),
                  child: Text(
                    'Select the level of the exercise:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    children: [
                      CheckboxMenuButton(
                        value: _beginner,
                        onChanged: (bool? value) {
                          setState(() {
                            _beginner = value!;
                          });
                        },
                        child: const Text(
                          'Beginner',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      CheckboxMenuButton(
                        value: _intermediate,
                        onChanged: (bool? value) {
                          setState(() {
                            _intermediate = value!;
                          });
                        },
                        child: const Text(
                          'Intermediate',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      CheckboxMenuButton(
                        value: _advanced,
                        onChanged: (bool? value) {
                          setState(() {
                            _advanced = value!;
                          });
                        },
                        child: const Text(
                          'Advanced',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 180, top: 20),
                  child: Text(
                    'Add images of the exercise:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Card(
                            color: const Color.fromARGB(255, 3, 12, 44),
                            child: Container(
                              width: 150,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 4 / 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          File(imagefileList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                      itemCount: imagefileList.length),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey)),
                        onPressed: () {
                          selectimages();
                        },
                        child: const Text('Add Images'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter description';
                      } else {
                        return null;
                      }
                    },
                    controller: _AddDescriptioncontroller,
                    decoration: const InputDecoration(
                        hintText: 'Write description about exercise...',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    style: const TextStyle(color: Colors.white),
                    maxLines: 5,
                    maxLength: null,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Select a ratio for the exercise:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        const SizedBox(height: 5),
                        DecimalNumberPicker(
                          textStyle: const TextStyle(color: Colors.amber),
                          value: _currentDoubleValue,
                          itemCount: 3,
                          minValue: 0,
                          maxValue: 2,
                          decimalPlaces: 1,
                          itemWidth: 70,
                          onChanged: (value) =>
                              setState(() => _currentDoubleValue = value),
                        ),
                        const SizedBox(height: 32),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.brown)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          AddExercise();
                          Addmsg1();
                          AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                  id: 1,
                                  channelKey: "basic_channel",
                                  title: "You have new exercise..!",
                                  body:
                                      "A new exercise is added by admin check out"));
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('ADD TO EXERCISE')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectimages() async {
    final selectedimages = await imagePicker.pickMultiImage();
    if (selectedimages.isNotEmpty) {
      for (var element in selectedimages) {
        imagefileList.add(element.path);
      }
    }
    setState(() {});
  }

  Future<void> AddExercise() async {
    List<Typelevel> levelList = [];
    print(imagefileList);
    // List<XFile> imagefileList = [];
    if (_beginner) {
      levelList.add(Typelevel.beginner);
    }
    if (_intermediate) {
      levelList.add(Typelevel.intermediate);
    }
    if (_advanced) {
      levelList.add(Typelevel.advanced);
    }
    final _AddText = _AddExercisecontroller.text;
    final _addDescription = _AddDescriptioncontroller.text;
    idtosent = DateTime.now().millisecondsSinceEpoch.toString();
    if (_AddText.isEmpty) {
      return;
    }

    if (_addDescription.isEmpty) {
      return;
    }

    if (imagefileList.isEmpty) {
      return;
    }
    if (_selectedCategory == null) {
      return;
    }

    final _model = CategoryModel(
        id: idtosent,
        type: _selectedCategory!,
        name: _AddText,
        image: imagefileList,
        description: _addDescription,
        timer: _currentDoubleValue,
        subtype: _selectedSubCategory!,
        leveltype: levelList);

    await CategoryDB().addExercise(_model);
  }

  Future<void> Addmsg1() async {
    const title = "You have new exercise..!";
    const bodymsg = "A new exercise is added by admin check out";
    msgidexercise = DateTime.now().millisecondsSinceEpoch;

    final msg = MessageModal(
        id: msgidexercise,
        message: title,
        body: bodymsg,
        time: DateFormat("hh:mm").format(DateTime.now()));

    await MessageDB().addMessage(msg);
  }
}

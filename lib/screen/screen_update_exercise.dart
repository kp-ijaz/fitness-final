import 'dart:io';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/category_db.dart';
import 'package:homeworkout/db%20model/db_model.dart';
// import 'package:homeworkout/db/category/category_db.dart';
// import 'package:homeworkout/db/db_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';

class AdminUpdateExercise extends StatefulWidget {
  CategoryType category;
  String name;
  SubCategoryType subtype;
  List<Typelevel> level;
  List<String> image;
  String description;
  double timer;
  String id;

  AdminUpdateExercise({
    super.key,
    required this.id,
    required this.category,
    required this.name,
    required this.subtype,
    required this.level,
    required this.image,
    required this.description,
    required this.timer,
  });

  @override
  State<AdminUpdateExercise> createState() => _AdminUpdateExerciseState();
}

String? val;

class _AdminUpdateExerciseState extends State<AdminUpdateExercise> {
  CategoryType? category;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  String? image = '';
  String? image1 = '';
  SubCategoryType? subtype;
  double? timer;
  late bool _beginner;
  late bool _intermediate;
  late bool _advanced;
  String id = '';

  @override
  void initState() {
    super.initState();
    category = widget.category;
    name = TextEditingController(text: widget.name);
    description = TextEditingController(text: widget.description);
    image = widget.image.toString();
    subtype = widget.subtype;
    timer = widget.timer;
    id = widget.id;
    if (widget.level.contains(Typelevel.beginner)) {
      _beginner = true;
    } else {
      _beginner = false;
    }
    if (widget.level.contains(Typelevel.advanced)) {
      _advanced = true;
    } else {
      _advanced = false;
    }
    if (widget.level.contains(Typelevel.intermediate)) {
      _intermediate = true;
    } else {
      _intermediate = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          elevation: 0,
          title: const Text('Update Exercise'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DropdownButtonFormField(
                    value: category,
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
                      category = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: name,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(204, 255, 255, 255))),
                    label: Text(
                      'Enter the name of exercise',
                      style: TextStyle(color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: DropdownButtonFormField(
                    value: subtype,
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
                      subtype = value;
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
                  'Add image of the exercise:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: image != null
                          ? Image.file(
                              File(image!),
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text(
                              'No image selected',
                              style: TextStyle(color: Colors.white),
                            )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: image1 != null
                          ? Image.file(
                              File(image1!),
                              fit: BoxFit.cover,
                            )
                          : const Center(
                              child: Text(
                              'No image selected',
                              style: TextStyle(color: Colors.white),
                            )),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () {
                        _pickImageFromGallery();
                      },
                      child: const Text('Add First Image'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.grey)),
                      onPressed: () {
                        _pickImage2FromGallery();
                      },
                      child: const Text('Add Second Image'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  controller: description,
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
                        value: timer!,
                        itemCount: 3,
                        minValue: 0,
                        maxValue: 2,
                        decimalPlaces: 1,
                        itemWidth: 70,
                        onChanged: (value) => setState(() => timer = value),
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
                    onPressed: () async {
                      await AddExercise();
                      Navigator.of(context).pop();
                    },
                    child: const Text('UPDATE EXERCISE')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final img = pickedFile.path;
      setState(
        () {
          image = img;
        },
      );
    }
  }

  Future<void> _pickImage2FromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final img1 = pickedFile.path;
      setState(() {
        image1 = img1;
      });
    } else {}
  }

  Future<void> AddExercise() async {
    List<Typelevel> levelList = [];
    List<String> image = [];
    if (_beginner) {
      levelList.add(Typelevel.beginner);
    }
    if (_intermediate) {
      levelList.add(Typelevel.intermediate);
    }
    if (_advanced) {
      levelList.add(Typelevel.advanced);
    }
    final _AddText = name.text;
    final _addDescription = description.text;

    final _model = CategoryModel(
        id: id,
        type: category!,
        name: _AddText,
        image: image,
        description: _addDescription,
        timer: timer!,
        subtype: subtype!,
        leveltype: levelList);

    await CategoryDB().addExercise(_model);
  }
}

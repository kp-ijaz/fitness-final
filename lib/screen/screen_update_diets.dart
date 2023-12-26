import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/screen/screen_diet_details.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/db_model.dart';
// import 'package:homeworkout/db/db_model.dart';
// import 'package:homeworkout/db/diet_model.dart';/
// import 'package:homeworkout/screen/diet.dart';
import 'package:image_picker/image_picker.dart';

class Update_diet extends StatefulWidget {
  DietType dietcategory;
  String name;
  String image;
  String description;
  String id;

  Update_diet(
      {super.key,
      required this.id,
      required this.dietcategory,
      required this.name,
      required this.image,
      required this.description});

  @override
  State<Update_diet> createState() => _Update_dietState();
}

class _Update_dietState extends State<Update_diet> {
  DietType? category;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  String? image = '';
  String id = '';

  @override
  void initState() {
    super.initState();
    category = widget.dietcategory;
    name = TextEditingController(text: widget.name);
    description = TextEditingController(text: widget.description);
    id = widget.id;
    image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          elevation: 0,
          title: const Text('Add Diet'),
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
                        value: DietType.breakfast,
                        child: Text('BREAKFAST'),
                      ),
                      DropdownMenuItem(
                        value: DietType.lunch,
                        child: Text('LUNCH'),
                      ),
                      DropdownMenuItem(
                        value: DietType.dinner,
                        child: Text('DINNER'),
                      ),
                    ],
                    onChanged: (value) {
                      category = value;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  controller: name,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xFFFFFFFF), style: BorderStyle.solid),
                    ),
                    labelText: 'Name of the food',
                    labelStyle: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
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
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  onPressed: () {
                    _pickImage1FromGallery();
                  },
                  child: const Text('Add First Image'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  controller: description,
                  decoration: const InputDecoration(
                      hintText: 'Description about food',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  style: const TextStyle(color: Colors.white),
                  maxLines: max(1, 5),
                  maxLength: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.brown)),
                    onPressed: () async {
                      await Adddiet();
                      await DietDB().refresh();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return DietDetails(
                            id: id,
                            dietcategory: category!,
                            name: name.text,
                            image: image!,
                            description: description.text);
                      }));
                    },
                    child: const Text('UPDATE DIET PLAN ')),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage1FromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final img2 = pickedFile.path;
      setState(() {
        image = img2;
      });
    } else {}
  }

  Future<void> Adddiet() async {
    final _Adddietname = name.text;
    final _AddDietDescription = description.text;

    final _diet = DietModal(
        id: id,
        type: category!,
        dietname: _Adddietname,
        image: image!,
        description: _AddDietDescription);
    await DietDB().addDiet(_diet);
  }
}

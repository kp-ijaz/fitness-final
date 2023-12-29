import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/diet_db.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/db%20model/message_model.dart';
// import 'package:homeworkout/db/category/diet_db.dart';
// import 'package:homeworkout/db/db_model.dart';
// import 'package:homeworkout/db/diet_model.dart';
// import 'package:homeworkout/screen/diet.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Add_diet extends StatefulWidget {
  const Add_diet({super.key});

  @override
  State<Add_diet> createState() => _Add_dietState();
}

class _Add_dietState extends State<Add_diet> {
  final formKey = GlobalKey<FormState>();
  DietType? _selectedCategory;
  final _AddDietcontroller = TextEditingController();
  String? _slctimg2;
  String id = '';
  int? msgid;
  final _AddDietDescriptioncontroller = TextEditingController();
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
                        _selectedCategory = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Name';
                      } else {
                        return null;
                      }
                    },
                    controller: _AddDietcontroller,
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
                    child: _slctimg2 != null
                        ? Image.file(
                            File(_slctimg2!),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Description';
                      } else {
                        return null;
                      }
                    },
                    controller: _AddDietDescriptioncontroller,
                    decoration: const InputDecoration(
                        hintText: 'Description about food',
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
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.brown)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Adding Diet...");
                          Adddiet();
                          print("Adding Message...");
                          Addmsg();
                          print("Creating Notification...");
                          AwesomeNotifications().createNotification(
                              content: NotificationContent(
                            wakeUpScreen: true,
                            id: 2,
                            channelKey: "basic_channel",
                            title: "Diet plan is updated..!",
                            body: "A new Diet is added by admin check out",
                          ));
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('ADD TO DIET PLAN ')),
                )
              ],
            ),
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
        _slctimg2 = img2;
      });
    } else {}
  }

  Future<void> Adddiet() async {
    final _Adddietname = _AddDietcontroller.text;
    final _AddDietDescription = _AddDietDescriptioncontroller.text;
    id = DateTime.now().millisecondsSinceEpoch.toString();
    if (_selectedCategory == null) {
      return;
    }
    if (_Adddietname.isEmpty) {
      return;
    }
    if (_slctimg2 == null) {
      return;
    }
    if (_AddDietDescription.isEmpty) {
      return;
    }
    print(id);
    final _diet = DietModal(
        type: _selectedCategory!,
        dietname: _Adddietname,
        image: _slctimg2!,
        id: id,
        description: _AddDietDescription);
    await DietDB().addDiet(_diet);
  }

  Future<void> Addmsg() async {
    const title = "Diet plan is updated..!";
    const bodymsg = "A new Diet is added by admin check out";
    msgid = DateTime.now().millisecondsSinceEpoch;
    final msg = MessageModal(
        id: msgid,
        message: title,
        body: bodymsg,
        time: DateFormat("hh:mm").format(DateTime.now()));
    await MessageDB().addMessage(msg);
  }
}

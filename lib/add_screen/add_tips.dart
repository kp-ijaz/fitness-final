// import 'dart:js';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/db%20model/category/tips_db.dart';
import 'package:homeworkout/db%20model/message_model.dart';
import 'package:homeworkout/db%20model/tips_model.dart';
import 'package:homeworkout/screen/category/tips.dart';
import 'package:intl/intl.dart';

class Addtips extends StatefulWidget {
  Addtips({super.key});

  @override
  State<Addtips> createState() => _AddtipsState();
}

class _AddtipsState extends State<Addtips> {
  final _Namecontroller = TextEditingController();

  final _UrlNamecontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String id = '';
  final urlRegex =
      RegExp(r"(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?");

  int? msgidtips;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 3, 12, 44),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 3, 12, 44),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            title: const Text('TIPS'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                    valueListenable: TipsDB().urlListNotifier,
                    builder:
                        (BuildContext ctx, List<TipsModal> newList, Widget? _) {
                      return newList.isEmpty
                          ? Center(
                              child: const Text(
                                'No data is available',
                                style: TextStyle(color: Colors.amber),
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (ctx, index) {
                                final value = newList[index];
                                return ListTile(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx1) => Tipspage(
                                                    url: value.urlName!,
                                                  )));
                                    },
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, left: 20),
                                      child: Text(
                                        value.name.toString(),
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              final result =
                                                  await showDialog<bool>(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                      'Are you sure?'),
                                                  content: const Text(
                                                      'This action will permanently delete this data'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, false),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        TipsDB().deleteTips(
                                                            value.id!);
                                                        Navigator.pop(
                                                            context, true);
                                                        TipsDB().refreshtips();
                                                      },
                                                      child:
                                                          const Text('Delete'),
                                                    ),
                                                  ],
                                                ),
                                              );

                                              if (result == null || !result) {
                                                return;
                                              }
                                            },

                                            //     () {
                                            //   TipsDB().deleteTips(value.id!);
                                            // },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ));
                              },
                              separatorBuilder: (ctx, index) {
                                return const Divider();
                              },
                              itemCount: newList.length);
                    }),
              ),
            ],
          ),
          floatingActionButton: CircleAvatar(
            radius: 30,
            child: IconButton(
              onPressed: () {
                dialoguebox(context);
              },
              icon: const Icon(Icons.add),
              iconSize: 30,
            ),
          )),
    );
  }

  Future<void> AddTips() async {
    final _name = _Namecontroller.text;
    final _url = _UrlNamecontroller.text;
    id = DateTime.now().millisecondsSinceEpoch.toString();

    final _tips = TipsModal(urlName: _url, name: _name, id: id);
    await TipsDB().addTips(_tips);
  }

  Future<void> dialoguebox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Add Tips'),
              content: Form(
                key: formKey,
                child: Container(
                  height: 200,
                  child: Column(children: [
                    TextFormField(
                      controller: _Namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Name';
                        } else {
                          return null;
                        }
                      },
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              style: BorderStyle.solid),
                        ),
                        labelText: 'Name of the tutorial',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        controller: _UrlNamecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid URL';
                          } else if (!urlRegex.hasMatch(value) ||
                              !value.contains("youtu.be")) {
                            return 'Please enter a valid URL';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        decoration: InputDecoration(
                          suffixIcon: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AddTips();
                                Addmsg();
                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                        wakeUpScreen: true,
                                        id: 2,
                                        channelKey: "basic_channel",
                                        title: "Some tips are Added..!",
                                        body:
                                            "A new Tip is added by admin check out"));
                                _Namecontroller.clear();
                                _UrlNamecontroller.clear();
                                Navigator.of(context).pop();
                              }
                            },
                            style: const ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(Colors.amber)),
                            child: const Text('Add'),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 0, 0),
                                style: BorderStyle.solid),
                          ),
                          labelText: 'Enter the url',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ));
        });
  }

  Future<void> Addmsg() async {
    const title = "Some tips are Added..!";
    const bodymsg = "A new Tip is added by admin check out";
    msgidtips = DateTime.now().millisecondsSinceEpoch;
    final msg = MessageModal(
        id: msgidtips,
        message: title,
        body: bodymsg,
        time: DateFormat("hh:mm").format(DateTime.now()));
    await MessageDB().addMessage(msg);
  }
}

// import 'dart:js';

// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:homeworkout/add_screen/add_exercise.dart';
import 'package:homeworkout/db%20model/category/message_db.dart';
import 'package:homeworkout/db%20model/message_model.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 12, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 12, 44),
        title: const Text('NOTIFICATIONS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: listview(),
    );
  }

  Widget listview() {
    return ValueListenableBuilder(
        valueListenable: MessageDB().exercisemsgNotifier,
        builder: (BuildContext context, List<MessageModal> newList, Widget? _) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final value = newList[index];
                return InkWell(
                  onLongPress: () async {
                    await MessageDB().deletemsg(value.id.toString());
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade700),
                                    child: const Icon(Icons.notifications,
                                        size: 25,
                                        color:
                                            Color.fromARGB(255, 196, 187, 187)),
                                  ),
                                  title: RichText(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                          text: value.message,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.amber,
                                              fontWeight: FontWeight.w500))),
                                  subtitle: Text(
                                    value.body,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  trailing: Text(
                                    value.time,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.amber,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                );
              },
              itemCount: newList.length);
        });
  }
}

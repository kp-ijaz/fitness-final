import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:homeworkout/db%20model/category/diet_db.dart';
// import 'package:homeworkout/db%20model/diet_model.dart';
import 'package:homeworkout/db%20model/message_model.dart';

const MESSAGE_DB_NAME = "message_db";

abstract class notificationmessages {
  Future<void> addMessage(MessageModal obj);
  Future<List<MessageModal>> getAllMsg();
  Future<void> refreshMessage();
  Future<void> deletemsg(String id);
}

class MessageDB implements notificationmessages {
  MessageDB._internal();

  static MessageDB instance = MessageDB._internal();

  factory MessageDB() {
    return instance;
  }
  ValueNotifier<List<MessageModal>> exercisemsgNotifier = ValueNotifier([]);

  @override
  Future<void> addMessage(MessageModal obj) async {
    final db = await Hive.openBox<MessageModal>(MESSAGE_DB_NAME);
    obj.id = await db.add(obj);
    await db.put(obj.id.toString(), obj);
    exercisemsgNotifier.value.clear();
    await refreshMessage();
  }

  @override
  Future<List<MessageModal>> getAllMsg() async {
    final db = await Hive.openBox<MessageModal>(MESSAGE_DB_NAME);
    return db.values.toList();
  }

  @override
  Future<void> refreshMessage() async {
    exercisemsgNotifier.value.clear();
    final messages = await getAllMsg();
    exercisemsgNotifier.value.clear();
    Future.forEach(messages, (element) {
      if (element.id != null) {
        exercisemsgNotifier.value.add(element);
      }
    });
    exercisemsgNotifier.notifyListeners();
  }

  @override
  Future<void> deletemsg(String id) async {
    final db = await Hive.openBox<MessageModal>(MESSAGE_DB_NAME);
    await db.delete(id);
    await refreshMessage();
  }
}

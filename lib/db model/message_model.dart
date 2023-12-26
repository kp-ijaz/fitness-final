import 'package:hive_flutter/hive_flutter.dart';
part 'message_model.g.dart';

@HiveType(typeId: 8)
class MessageModal {
  @HiveField(0)
  String message;
  @HiveField(1)
  String body;
  @HiveField(2)
  String time;
  @HiveField(3)
  int? id;

  MessageModal(
      {required this.message, required this.body, required this.time, this.id});
}

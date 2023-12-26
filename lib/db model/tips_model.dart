import 'package:hive_flutter/hive_flutter.dart';
part 'tips_model.g.dart';

@HiveType(typeId: 7)
class TipsModal {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? urlName;
  @HiveField(2)
  String? id;

  TipsModal({required this.urlName, required this.name, this.id});
}

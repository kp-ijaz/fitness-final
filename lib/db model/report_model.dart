import 'package:hive_flutter/hive_flutter.dart';
part 'report_model.g.dart';

@HiveType(typeId: 9)
class Reportmodal {
  @HiveField(0)
  String? id;
  @HiveField(1)
  final List<int> time;

  Reportmodal({required this.id, required this.time});
}

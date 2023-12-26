import 'package:hive_flutter/hive_flutter.dart';
part 'diet_model.g.dart';

@HiveType(typeId: 4)
enum DietType {
  @HiveField(0)
  breakfast,
  @HiveField(1)
  lunch,
  @HiveField(2)
  dinner,
}

@HiveType(typeId: 3)
class DietModal {
  @HiveField(0)
  final DietType type;
  @HiveField(1)
  final String dietname;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String description;
  @HiveField(4)
  String? id;

  DietModal(
      {required this.type,
      this.id,
      required this.dietname,
      required this.image,
      required this.description}) {
    // id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}

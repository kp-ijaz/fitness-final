import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
part 'db_model.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  withoutEqupment,
  @HiveField(1)
  gym,
  @HiveField(2)
  yoga,
}

@HiveType(typeId: 5)
enum SubCategoryType {
  @HiveField(0)
  fullbody,
  @HiveField(1)
  lowerbody
}

@HiveType(typeId: 6)
enum Typelevel {
  @HiveField(0)
  beginner,
  @HiveField(1)
  intermediate,
  @HiveField(2)
  advanced,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  CategoryType type;
  @HiveField(2)
  String name;
  @HiveField(3)
  SubCategoryType subtype;
  @HiveField(4)
  List<Typelevel> leveltype;
  @HiveField(5)
  List<String> image;
  @HiveField(6)
  String description;
  @HiveField(7)
  double timer;
  @HiveField(8)
  bool isDeleted;

  CategoryModel({
    required this.type,
    required this.name,
    required this.subtype,
    required this.leveltype,
    required this.image,
    required this.description,
    this.id,
    required this.timer,
    this.isDeleted = false,
  }) {
    // id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}

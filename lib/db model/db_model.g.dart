// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 1;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      type: fields[1] as CategoryType,
      name: fields[2] as String,
      subtype: fields[3] as SubCategoryType,
      leveltype: (fields[4] as List).cast<Typelevel>(),
      image: (fields[5] as List).cast<String>(),
      description: fields[6] as String,
      id: fields[0] as String?,
      timer: fields[7] as double,
      isDeleted: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.subtype)
      ..writeByte(4)
      ..write(obj.leveltype)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.timer)
      ..writeByte(8)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 2;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.withoutEqupment;
      case 1:
        return CategoryType.gym;
      case 2:
        return CategoryType.yoga;
      default:
        return CategoryType.withoutEqupment;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.withoutEqupment:
        writer.writeByte(0);
        break;
      case CategoryType.gym:
        writer.writeByte(1);
        break;
      case CategoryType.yoga:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubCategoryTypeAdapter extends TypeAdapter<SubCategoryType> {
  @override
  final int typeId = 5;

  @override
  SubCategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SubCategoryType.fullbody;
      case 1:
        return SubCategoryType.lowerbody;
      default:
        return SubCategoryType.fullbody;
    }
  }

  @override
  void write(BinaryWriter writer, SubCategoryType obj) {
    switch (obj) {
      case SubCategoryType.fullbody:
        writer.writeByte(0);
        break;
      case SubCategoryType.lowerbody:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypelevelAdapter extends TypeAdapter<Typelevel> {
  @override
  final int typeId = 6;

  @override
  Typelevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Typelevel.beginner;
      case 1:
        return Typelevel.intermediate;
      case 2:
        return Typelevel.advanced;
      default:
        return Typelevel.beginner;
    }
  }

  @override
  void write(BinaryWriter writer, Typelevel obj) {
    switch (obj) {
      case Typelevel.beginner:
        writer.writeByte(0);
        break;
      case Typelevel.intermediate:
        writer.writeByte(1);
        break;
      case Typelevel.advanced:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypelevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

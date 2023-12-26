// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietModalAdapter extends TypeAdapter<DietModal> {
  @override
  final int typeId = 3;

  @override
  DietModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietModal(
      type: fields[0] as DietType,
      id: fields[4] as String?,
      dietname: fields[1] as String,
      image: fields[2] as String,
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DietModal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.dietname)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DietTypeAdapter extends TypeAdapter<DietType> {
  @override
  final int typeId = 4;

  @override
  DietType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DietType.breakfast;
      case 1:
        return DietType.lunch;
      case 2:
        return DietType.dinner;
      default:
        return DietType.breakfast;
    }
  }

  @override
  void write(BinaryWriter writer, DietType obj) {
    switch (obj) {
      case DietType.breakfast:
        writer.writeByte(0);
        break;
      case DietType.lunch:
        writer.writeByte(1);
        break;
      case DietType.dinner:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

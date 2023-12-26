// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TipsModalAdapter extends TypeAdapter<TipsModal> {
  @override
  final int typeId = 7;

  @override
  TipsModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TipsModal(
      urlName: fields[1] as String?,
      name: fields[0] as String?,
      id: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TipsModal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.urlName)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TipsModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

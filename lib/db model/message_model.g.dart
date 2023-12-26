// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageModalAdapter extends TypeAdapter<MessageModal> {
  @override
  final int typeId = 8;

  @override
  MessageModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessageModal(
      message: fields[0] as String,
      body: fields[1] as String,
      time: fields[2] as String,
      id: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MessageModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

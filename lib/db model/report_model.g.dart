// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportmodalAdapter extends TypeAdapter<Reportmodal> {
  @override
  final int typeId = 9;

  @override
  Reportmodal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reportmodal(
      id: fields[0] as String?,
      time: (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Reportmodal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportmodalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

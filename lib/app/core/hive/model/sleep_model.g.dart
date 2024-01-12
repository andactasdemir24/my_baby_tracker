// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepAdapter extends TypeAdapter<Sleep> {
  @override
  final int typeId = 1;

  @override
  Sleep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sleep(
      id: fields[0] as String?,
      fellSleep: fields[1] as DateTime?,
      wokeUp: fields[2] as DateTime?,
      text: fields[3] as String?,
      createdTime: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Sleep obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fellSleep)
      ..writeByte(2)
      ..write(obj.wokeUp)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.createdTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

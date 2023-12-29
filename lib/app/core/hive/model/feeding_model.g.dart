// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedingAdapter extends TypeAdapter<Feeding> {
  @override
  final int typeId = 0;

  @override
  Feeding read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Feeding(
      id: fields[0] as String?,
      time: fields[1] as DateTime?,
      amount: fields[2] as int?,
      text: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Feeding obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nappy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NappyAdapter extends TypeAdapter<Nappy> {
  @override
  final int typeId = 8;

  @override
  Nappy read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nappy(
      id: fields[0] as String?,
      nappyTime: fields[1] as DateTime?,
      napList: (fields[2] as List?)?.cast<NappyModel>(),
      text: fields[3] as String?,
      createdTime: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Nappy obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nappyTime)
      ..writeByte(2)
      ..write(obj.napList)
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
      other is NappyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VaccineAdapter extends TypeAdapter<Vaccine> {
  @override
  final int typeId = 9;

  @override
  Vaccine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Vaccine(
      id: fields[0] as String?,
      date: fields[1] as String?,
      vaccine: fields[2] as String?,
      text: fields[3] as String?,
      createdTime: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Vaccine obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.vaccine)
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
      other is VaccineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

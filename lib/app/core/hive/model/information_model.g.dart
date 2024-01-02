// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InformationAdapter extends TypeAdapter<Information> {
  @override
  final int typeId = 4;

  @override
  Information read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Information(
      id: fields[0] as String?,
      fullname: fields[1] as String?,
      image: fields[2] as File?,
      birthDate: fields[3] as String?,
      width: fields[4] as int?,
      height: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Information obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullname)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.birthDate)
      ..writeByte(4)
      ..write(obj.width)
      ..writeByte(5)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

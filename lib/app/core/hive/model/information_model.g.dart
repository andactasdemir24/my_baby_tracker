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
      image: fields[1] as String?,
      genderList: (fields[2] as List?)?.cast<InformationGender>(),
      fullname: fields[3] as String?,
      birthDate: fields[4] as String?,
      weight: fields[5] as int?,
      height: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Information obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.genderList)
      ..writeByte(3)
      ..write(obj.fullname)
      ..writeByte(4)
      ..write(obj.birthDate)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
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

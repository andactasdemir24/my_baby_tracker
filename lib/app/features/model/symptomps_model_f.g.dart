// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptomps_model_f.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SymptopmsModelAdapter extends TypeAdapter<SymptopmsModel> {
  @override
  final int typeId = 3;

  @override
  SymptopmsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SymptopmsModel(
      image: fields[0] as String?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SymptopmsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymptopmsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

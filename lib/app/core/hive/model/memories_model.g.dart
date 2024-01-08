// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoriesModelAdapter extends TypeAdapter<MemoriesModel> {
  @override
  final int typeId = 6;

  @override
  MemoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoriesModel(
      id: fields[0] as String?,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MemoriesModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

import 'package:hive/hive.dart';

part 'memories_model.g.dart';

@HiveType(typeId: 6)
class MemoriesModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? image;

  //bool isSelected;

  MemoriesModel({
    required this.id,
    required this.image,
  });
}

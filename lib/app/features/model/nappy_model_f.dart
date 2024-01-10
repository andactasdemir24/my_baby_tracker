import 'package:hive/hive.dart';
part 'nappy_model_f.g.dart';

@HiveType(typeId: 7)
class NappyModel extends HiveObject {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? name;

  NappyModel({
    required this.image,
    required this.name,
  });

  NappyModel copyWith({
    String? image,
    String? name,
  }) {
    return NappyModel(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }
}

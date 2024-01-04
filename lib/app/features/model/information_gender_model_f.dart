import 'package:hive/hive.dart';
part 'information_gender_model_f.g.dart';

@HiveType(typeId: 5)
class InformationGender extends HiveObject {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? name;

  InformationGender({
    required this.image,
    required this.name,
  });

  InformationGender copyWith({
    String? image,
    String? name,
  }) {
    return InformationGender(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }
}

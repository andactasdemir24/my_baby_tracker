// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'symptomps_model_f.g.dart';

@HiveType(typeId: 3)
class SymptopmsModel extends HiveObject {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? name;

  SymptopmsModel({
    required this.image,
    required this.name,
  });

  SymptopmsModel copyWith({
    String? image,
    String? name,
  }) {
    return SymptopmsModel(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }
}

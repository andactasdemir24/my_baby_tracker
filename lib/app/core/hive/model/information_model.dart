import 'package:baby_tracker_app/app/features/model/information_gender_model_f.dart';
import 'package:hive/hive.dart';

part 'information_model.g.dart';

@HiveType(typeId: 4)
class Information extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? image;

  @HiveField(2)
  List<InformationGender>? genderList;

  @HiveField(3)
  String? fullname;

  @HiveField(4)
  String? birthDate;

  @HiveField(5)
  int? weight;

  @HiveField(6)
  int? height;

  //bool isSelected;

  @HiveField(7)
  String? selectedGender;

  Information({
    required this.id,
    required this.image,
    required this.genderList,
    required this.fullname,
    required this.birthDate,
    required this.weight,
    required this.height,
    this.selectedGender,
  });

  // Feeding copyWith({bool? isSelected}) {
  //   return Feeding(
  //     id: id,
  //     time: time,
  //     amount: amount,
  //     text: text,
  //     isSelected: isSelected ?? this.isSelected,
  //   );
  // }
}

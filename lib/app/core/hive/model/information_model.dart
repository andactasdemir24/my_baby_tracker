import 'dart:io';
import 'package:hive/hive.dart';

part 'information_model.g.dart';

@HiveType(typeId: 4)
class Information extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? fullname;

  @HiveField(2)
  File? image;

  @HiveField(3)
  String? birthDate;

  @HiveField(4)
  int? width;

  @HiveField(5)
  int? height;

  //bool isSelected;

  Information({
    required this.id,
    required this.fullname,
    required this.image,
    required this.birthDate,
    required this.width,
    required this.height,
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

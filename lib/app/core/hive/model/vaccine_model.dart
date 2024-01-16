import 'package:hive/hive.dart';

part 'vaccine_model.g.dart';

@HiveType(typeId: 9)
class Vaccine extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? date;

  @HiveField(2)
  String? vaccine;

  @HiveField(3)
  String? text;

  @HiveField(4)
  DateTime? createdTime;

  bool isSelected;

  Vaccine({
    required this.id,
    required this.date,
    required this.vaccine,
    required this.text,
    required this.createdTime,
    this.isSelected = false,
  });

  Vaccine copyWith({bool? isSelected}) {
    return Vaccine(
      id: id,
      date: date,
      vaccine: vaccine,
      text: text,
      createdTime: createdTime,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

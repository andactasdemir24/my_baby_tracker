import 'package:hive/hive.dart';

part 'feeding_model.g.dart';

@HiveType(typeId: 0)
class Feeding extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? time;

  @HiveField(2)
  int? amount;

  @HiveField(3)
  String? text;

  @HiveField(4)
  DateTime? createdTime;

  bool isSelected;

  Feeding({
    required this.id,
    required this.time,
    required this.amount,
    required this.text,
    required this.createdTime,
    this.isSelected = false,
  });

  Feeding copyWith({bool? isSelected}) {
    return Feeding(
      id: id,
      time: time,
      amount: amount,
      text: text,
      createdTime: createdTime,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

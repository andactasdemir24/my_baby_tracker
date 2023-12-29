import 'package:hive/hive.dart';

part 'sleep_model.g.dart';

@HiveType(typeId: 1)
class Sleep extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? fellSleep;

  @HiveField(2)
  DateTime? wokeUp;

  @HiveField(3)
  String? text;

  bool isSelected;

  Sleep({
    required this.id,
    required this.fellSleep,
    required this.wokeUp,
    required this.text,
    this.isSelected = false,
  });

  Sleep copyWith({bool? isSelected}) {
    return Sleep(
      id: id,
      fellSleep: fellSleep,
      wokeUp: wokeUp,
      text: text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

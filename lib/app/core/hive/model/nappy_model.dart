import 'package:baby_tracker_app/app/features/model/nappy_model_f.dart';
import 'package:hive/hive.dart';
part 'nappy_model.g.dart';

@HiveType(typeId: 8)
class Nappy extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? nappyTime;

  @HiveField(2)
  List<NappyModel>? nappyList;

  @HiveField(3)
  String? text;

  bool isSelected;

  Nappy({
    required this.id,
    required this.nappyTime,
    required this.nappyList,
    required this.text,
    this.isSelected = false,
  });

  Nappy copyWith({bool? isSelected}) {
    return Nappy(
      id: id,
      nappyTime: nappyTime,
      nappyList: nappyList,
      text: text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

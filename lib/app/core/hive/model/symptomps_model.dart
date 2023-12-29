import 'package:hive/hive.dart';

import '../../../features/model/symptomps_model_f.dart';

part 'symptomps_model.g.dart';

@HiveType(typeId: 2)
class Symptomps extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? symTime;

  @HiveField(2)
  List<SymptopmsModel>? sympList;

  @HiveField(3)
  String? text;

  bool isSelected;

  Symptomps({
    required this.id,
    required this.symTime,
    required this.sympList,
    required this.text,
    this.isSelected = false,
  });

  Symptomps copyWith({bool? isSelected}) {
    return Symptomps(
      id: id,
      symTime: symTime,
      sympList: sympList,
      text: text,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

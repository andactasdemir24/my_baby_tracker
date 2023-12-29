import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class SymptompsDatasource {
  Future<Result> add(Symptomps symptompsModel);
  Future<void> clear();
  Future<DataResult<List<Symptomps>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Symptomps symptompsModel);
}

import 'package:baby_tracker_app/app/core/hive/model/vaccine_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class VaccineDatasource {
  Future<Result> add(Vaccine vaccineModel);
  Future<void> clear();
  Future<DataResult<List<Vaccine>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Vaccine vaccineModel);
}

import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class SleepDatasource {
  Future<Result> add(Sleep sleepModel);
  Future<void> clear();
  Future<DataResult<List<Sleep>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Sleep sleepModel);
}

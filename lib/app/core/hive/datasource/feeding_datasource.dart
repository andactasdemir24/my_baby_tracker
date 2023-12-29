import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class FeedingDatasource {
  Future<Result> add(Feeding feedingModel);
  Future<void> clear();
  Future<DataResult<List<Feeding>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Feeding feedingModel);
}

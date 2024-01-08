import 'package:baby_tracker_app/app/core/hive/model/memories_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class MemoriesDatasource {
  Future<Result> add(MemoriesModel memoriesModel);
  Future<Result> clear();
  Future<DataResult<List<MemoriesModel>>> getAll();
  Future<Result> delete(String id);
}

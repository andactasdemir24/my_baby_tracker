import 'package:baby_tracker_app/app/core/hive/model/information_model.dart';

import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class InformationDatasource {
  Future<Result> add(Information informationModel);
  Future<void> clear();
  Future<DataResult<List<Information>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Information informationModel);
  Future<DataResult<Information>> get();
}

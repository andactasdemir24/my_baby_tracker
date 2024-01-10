import 'package:baby_tracker_app/app/core/hive/model/nappy_model.dart';
import '../../utils/data_result.dart';
import '../../utils/result.dart';

abstract class NappyDatasource {
  Future<Result> add(Nappy nappy);
  Future<void> clear();
  Future<DataResult<List<Nappy>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Nappy nappy);
}

import 'package:baby_tracker_app/app/app.dart';

abstract class MemoriesDatasource {
  Future<Result> add(MemoriesModel memoriesModel);
  Future<Result> clear();
  Future<DataResult<List<MemoriesModel>>> getAll();
  Future<Result> delete(String id);
}

import 'package:baby_tracker_app/app/app.dart';

class MemoriesDatasourceImp extends MemoriesDatasource {
  @override
  Future<Result> add(MemoriesModel memoriesModel) async {
    try {
      await memoriesBox.put(memoriesModel.id, memoriesModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await memoriesBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await memoriesBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<MemoriesModel>>> getAll() async {
    try {
      var list = memoriesBox.values.toList();
      return DataResult.success("Success", data: list);
    } catch (e) {
      return DataResult.fail(e.toString());
    }
  }
}

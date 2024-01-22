import 'package:baby_tracker_app/app/app.dart';

class SleepDatasourceImp extends SleepDatasource {
  @override
  Future<Result> add(Sleep sleepModel) async {
    try {
      await sleepBox.put(sleepModel.id, sleepModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await sleepBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Sleep sleepModel) async {
    try {
      await sleepBox.put(sleepModel.id, sleepModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await sleepBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Sleep>>> getAll() async {
    try {
      var list2 = sleepBox.values.toList();
      list2.sort((a, b) {
        DateTime aTime = a.createdTime ?? DateTime.now();
        DateTime bTime = b.createdTime ?? DateTime.now();
        return bTime.compareTo(aTime);
      });
      return DataResult<List<Sleep>>.success("Success", data: list2);
    } catch (e) {
      return DataResult<List<Sleep>>.fail(e.toString());
    }
  }
}

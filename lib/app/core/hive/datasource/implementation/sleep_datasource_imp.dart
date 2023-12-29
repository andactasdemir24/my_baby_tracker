import 'package:baby_tracker_app/app/core/hive/data/hive_box.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/utils/result.dart';

import '../../../utils/data_result.dart';

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
      return DataResult<List<Sleep>>.success("Success", data: list2);
    } catch (e) {
      return DataResult<List<Sleep>>.fail(e.toString());
    }
  }
}

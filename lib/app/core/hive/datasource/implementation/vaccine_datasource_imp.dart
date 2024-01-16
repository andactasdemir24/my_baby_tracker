import 'package:baby_tracker_app/app/core/hive/data/hive_box.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/vaccine_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/vaccine_model.dart';
import 'package:baby_tracker_app/app/core/utils/data_result.dart';
import 'package:baby_tracker_app/app/core/utils/result.dart';

class VaccineDatasourceImp extends VaccineDatasource {
  @override
  Future<Result> add(Vaccine vaccineModel) async {
    try {
      await vaccineBox.put(vaccineModel.id, vaccineModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await vaccineBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await vaccineBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Vaccine>>> getAll() async {
    try {
      var list6 = vaccineBox.values.toList();
      list6.sort((a, b) {
        DateTime aTime = a.createdTime ?? DateTime.now();
        DateTime bTime = b.createdTime ?? DateTime.now();
        return bTime.compareTo(aTime);
      });
      return DataResult.success("Success", data: list6);
    } catch (e) {
      return DataResult.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Vaccine vaccineModel) async {
    try {
      await vaccineBox.put(vaccineModel.id, vaccineModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}

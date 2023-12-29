import 'package:baby_tracker_app/app/core/hive/data/hive_box.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/core/utils/data_result.dart';

import '../../../utils/result.dart';
import '../symptomps_datasource.dart';

class SymptompsDatasourceImp extends SymptompsDatasource {
  @override
  Future<Result> add(Symptomps symptompsModel) async {
    try {
      await symptompsBox.put(symptompsModel.id, symptompsModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await symptompsBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Symptomps>>> getAll() async {
    try {
      var list3 = symptompsBox.values.toList();
      return DataResult<List<Symptomps>>.success("Success", data: list3);
    } catch (e) {
      return DataResult<List<Symptomps>>.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await symptompsBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Symptomps symptompsModel) async {
    try {
      await symptompsBox.put(symptompsModel.id, symptompsModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}

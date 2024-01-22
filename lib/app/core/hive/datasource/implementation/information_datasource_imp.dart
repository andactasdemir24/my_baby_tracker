import 'package:baby_tracker_app/app/app.dart';

class InformationDatasourceImp extends InformationDatasource {
  @override
  Future<Result> add(Information informationModel) async {
    try {
      await informationBox.put(informationModel.id, informationModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await informationBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await informationBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Information>>> getAll() async {
    try {
      var list = informationBox.values.toList();
      return DataResult<List<Information>>.success("Success", data: list);
    } catch (e) {
      return DataResult<List<Information>>.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Information informationModel) async {
    try {
      await informationBox.put(informationModel.id, informationModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<Information>> get() async {
    try {
      var allInformations = informationBox.values.toList();
      if (allInformations.isNotEmpty) {
        return DataResult<Information>.success("Success", data: allInformations.single);
      } else {
        return DataResult<Information>.fail("No information available");
      }
    } catch (e) {
      return DataResult<Information>.fail(e.toString());
    }
  }
}

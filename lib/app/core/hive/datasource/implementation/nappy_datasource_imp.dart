import 'package:baby_tracker_app/app/app.dart';

class NappyDatasourceImp extends NappyDatasource {
  @override
  Future<Result> add(Nappy nappy) async {
    try {
      await nappyBox.put(nappy.id, nappy);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await nappyBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Nappy>>> getAll() async {
    try {
      var list4 = nappyBox.values.toList();
      list4.sort((a, b) {
        DateTime aTime = a.createdTime ?? DateTime.now();
        DateTime bTime = b.createdTime ?? DateTime.now();
        return bTime.compareTo(aTime);
      });

      return DataResult<List<Nappy>>.success("Success", data: list4);
    } catch (e) {
      return DataResult<List<Nappy>>.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await nappyBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Nappy nappy) async {
    try {
      await nappyBox.put(nappy.id, nappy);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }
}

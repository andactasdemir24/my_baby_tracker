import 'package:baby_tracker_app/app/app.dart';

class FeedingDatasourceImp extends FeedingDatasource {
  @override
  Future<Result> add(Feeding feedingModel) async {
    try {
      await feedingBox.put(feedingModel.id, feedingModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> delete(String id) async {
    try {
      await feedingBox.delete(id);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> update(Feeding feedingModel) async {
    try {
      await feedingBox.put(feedingModel.id, feedingModel);
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<Result> clear() async {
    try {
      await feedingBox.clear();
      return Result.success();
    } catch (e) {
      return Result.fail(e.toString());
    }
  }

  @override
  Future<DataResult<List<Feeding>>> getAll() async {
    try {
      var list = feedingBox.values.toList();
      list.sort((a, b) {
        DateTime aTime = a.createdTime ?? DateTime.now();
        DateTime bTime = b.createdTime ?? DateTime.now();
        return bTime.compareTo(aTime);
      });
      return DataResult<List<Feeding>>.success("Success", data: list);
    } catch (e) {
      return DataResult<List<Feeding>>.fail(e.toString());
    }
  }
}

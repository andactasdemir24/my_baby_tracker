import 'package:baby_tracker_app/app/app.dart';

abstract class FeedingDatasource {
  Future<Result> add(Feeding feedingModel);
  Future<void> clear();
  Future<DataResult<List<Feeding>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Feeding feedingModel);
}

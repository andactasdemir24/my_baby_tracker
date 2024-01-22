import 'package:baby_tracker_app/app/app.dart';

abstract class NappyDatasource {
  Future<Result> add(Nappy nappy);
  Future<void> clear();
  Future<DataResult<List<Nappy>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Nappy nappy);
}

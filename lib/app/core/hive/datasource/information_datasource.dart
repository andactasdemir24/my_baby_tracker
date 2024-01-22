import 'package:baby_tracker_app/app/app.dart';

abstract class InformationDatasource {
  Future<Result> add(Information informationModel);
  Future<void> clear();
  Future<DataResult<List<Information>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Information informationModel);
  Future<DataResult<Information>> get();
}

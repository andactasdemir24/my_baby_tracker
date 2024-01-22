import 'package:baby_tracker_app/app/app.dart';

abstract class VaccineDatasource {
  Future<Result> add(Vaccine vaccineModel);
  Future<void> clear();
  Future<DataResult<List<Vaccine>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Vaccine vaccineModel);
}

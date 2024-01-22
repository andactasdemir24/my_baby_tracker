import 'package:baby_tracker_app/app/app.dart';

abstract class SymptompsDatasource {
  Future<Result> add(Symptomps symptompsModel);
  Future<void> clear();
  Future<DataResult<List<Symptomps>>> getAll();
  Future<Result> delete(String id);
  Future<Result> update(Symptomps symptompsModel);
}

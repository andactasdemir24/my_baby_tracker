import 'package:get_it/get_it.dart';
import 'package:baby_tracker_app/app/app.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => OnboardingViewmodel());
  locator.registerLazySingleton(() => FeedingViewModel());
  locator.registerLazySingleton(() => SleepViewModel());
  locator.registerLazySingleton(() => SymptompsViewmodel());
  locator.registerLazySingleton(() => CalenderViewModel());
  locator.registerLazySingleton(() => InformationViewModel());
  locator.registerLazySingleton(() => MemoriesViewModel());
  locator.registerLazySingleton(() => NappyViewModel());
  locator.registerLazySingleton(() => VaccineViewModel());

  //data source
  locator.registerLazySingleton<FeedingDatasource>(() => FeedingDatasourceImp());
  locator.registerLazySingleton<SleepDatasource>(() => SleepDatasourceImp());
  locator.registerLazySingleton<SymptompsDatasource>(() => SymptompsDatasourceImp());
  locator.registerLazySingleton<InformationDatasource>(() => InformationDatasourceImp());
  locator.registerLazySingleton<MemoriesDatasource>(() => MemoriesDatasourceImp());
  locator.registerLazySingleton<NappyDatasource>(() => NappyDatasourceImp());
  locator.registerLazySingleton<VaccineDatasource>(() => VaccineDatasourceImp());
}

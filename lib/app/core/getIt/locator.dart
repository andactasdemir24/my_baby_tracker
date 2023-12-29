import 'package:baby_tracker_app/app/core/hive/datasource/feeding_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/implementation/feeding_datasource_imp.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/implementation/sleep_datasource_imp.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/implementation/symptomps_datasource_imp.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/symptomps_datasource.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/viewmodel/symptomps_viewmodel.dart';
import 'package:get_it/get_it.dart';
import '../../features/screens/calender/viewmodel/calender_viewmodel.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => OnboardingViewmodel());
  locator.registerLazySingleton(() => FeedingViewModel());
  locator.registerLazySingleton(() => SleepViewModel());
  locator.registerLazySingleton(() => SymptompsViewmodel());
  locator.registerLazySingleton(() => CalenderViewModel());

  //data source
  locator.registerLazySingleton<FeedingDatasource>(() => FeedingDatasourceImp());
  locator.registerLazySingleton<SleepDatasource>(() => SleepDatasourceImp());
  locator.registerLazySingleton<SymptompsDatasource>(() => SymptompsDatasourceImp());
}

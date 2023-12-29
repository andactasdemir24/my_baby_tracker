import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/features/model/symptomps_model_f.dart';
import 'package:hive/hive.dart';

late Box<Feeding> feedingBox;
late Box<Sleep> sleepBox;
late Box<Symptomps> symptompsBox;

Future<void> hiveBox() async {
  feedingBox = await Hive.openBox<Feeding>('feeding');
  sleepBox = await Hive.openBox<Sleep>('sleep');
  symptompsBox = await Hive.openBox<Symptomps>('symptomps');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<Feeding>(FeedingAdapter());
  Hive.registerAdapter<Sleep>(SleepAdapter());
  Hive.registerAdapter<Symptomps>(SymptompsAdapter());
  Hive.registerAdapter<SymptopmsModel>(SymptopmsModelAdapter());
}

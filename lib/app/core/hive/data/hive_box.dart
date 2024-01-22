import 'package:hive/hive.dart';
import 'package:baby_tracker_app/app/app.dart';

late Box<Feeding> feedingBox;
late Box<Sleep> sleepBox;
late Box<Symptomps> symptompsBox;
late Box<Information> informationBox;
late Box<MemoriesModel> memoriesBox;
late Box<Nappy> nappyBox;
late Box<Vaccine> vaccineBox;

Future<void> hiveBox() async {
  feedingBox = await Hive.openBox<Feeding>('feeding');
  sleepBox = await Hive.openBox<Sleep>('sleep');
  symptompsBox = await Hive.openBox<Symptomps>('symptomps');
  informationBox = await Hive.openBox<Information>('information');
  memoriesBox = await Hive.openBox<MemoriesModel>('memories');
  nappyBox = await Hive.openBox<Nappy>('nappy');
  vaccineBox = await Hive.openBox<Vaccine>('vaccine');
}

void hiveRegisterAdapter() {
  Hive.registerAdapter<Feeding>(FeedingAdapter());
  Hive.registerAdapter<Sleep>(SleepAdapter());
  Hive.registerAdapter<Symptomps>(SymptompsAdapter());
  Hive.registerAdapter<SymptopmsModel>(SymptopmsModelAdapter());
  Hive.registerAdapter<Information>(InformationAdapter());
  Hive.registerAdapter<InformationGender>(InformationGenderAdapter());
  Hive.registerAdapter<MemoriesModel>(MemoriesModelAdapter());
  Hive.registerAdapter<Nappy>(NappyAdapter());
  Hive.registerAdapter<NappyModel>(NappyModelAdapter());
  Hive.registerAdapter<Vaccine>(VaccineAdapter());
}

import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/Informations/viewmodel/information_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/view/feeding_page.dart';
import 'package:baby_tracker_app/app/features/screens/home/widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/features/screens/nappy/view/nappy_page.dart';
import 'package:baby_tracker_app/app/features/screens/nappy/viewmodel/nappy_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/sleep/view/sleep_page.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_page.dart';
import 'package:baby_tracker_app/app/features/screens/vaccine/view/vaccine_page.dart';
import 'package:baby_tracker_app/app/features/screens/vaccine/viewmodel/vaccine_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../feeding/viewmodel/feeding_viewmodel.dart';
import '../../sleep/viewmodel/sleep_viewmodel.dart';
import '../../symptomps/viewmodel/symptomps_viewmodel.dart';
import '../widgets/custom_container.dart';
import '../widgets/custom_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetate();
}

class _HomePagetate extends State<HomePage> {
  var feedingViewmodel = locator.get<FeedingViewModel>();
  var sleepViewmodel = locator.get<SleepViewModel>();
  var symptompsViewmodel = locator.get<SymptompsViewmodel>();
  var informationVeiwmodel = locator.get<InformationViewModel>();
  var nappyViewmodel = locator.get<NappyViewModel>();
  var vaccineViewmodel = locator.get<VaccineViewModel>();

  @override
  void initState() {
    super.initState();
    informationVeiwmodel.fetchLatestInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.shade100,
        appBar: const CustomAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (context) {
                return CustomStack(informationVeiwmodel: informationVeiwmodel);
              }),
              SizedBox(height: displayHeight(context) * 0.1),
              GestureDetector(
                  onTap: () {
                    feedingViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedingPage()));
                  },
                  child: CustomImageContainer(image: ImagesConst.homeImage1)),
              GestureDetector(
                  onTap: () {
                    sleepViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepPage()));
                  },
                  child: CustomImageContainer(image: ImagesConst.homeImage2)),
              GestureDetector(
                  onTap: () {
                    symptompsViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SymptompsPage()));
                  },
                  child: CustomImageContainer(image: ImagesConst.homeImage3)),
              GestureDetector(
                  onTap: () {
                    nappyViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NappyPage()));
                  },
                  child: CustomImageContainer(image: ImagesConst.homeImage4)),
              GestureDetector(
                  onTap: () {
                    vaccineViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinePage()));
                  },
                  child: CustomImageContainer(image: ImagesConst.homeImage5)),
            ],
          ),
        ));
  }
}

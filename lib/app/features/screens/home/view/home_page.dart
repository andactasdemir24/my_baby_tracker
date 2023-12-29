import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/view/feeding_page.dart';
import 'package:baby_tracker_app/app/features/screens/home/widgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/features/screens/sleep/view/sleep_page.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/getIt/locator.dart';
import '../../feeding/viewmodel/feeding_viewmodel.dart';
import '../../sleep/viewmodel/sleep_viewmodel.dart';
import '../../symptomps/viewmodel/symptomps_viewmodel.dart';
import '../widgets/custom_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagetate();
}

class _HomePagetate extends State<HomePage> {
  final feedingViewmodel = locator.get<FeedingViewModel>();
  final sleepViewmodel = locator.get<SleepViewModel>();
  final symptompsViewmodel = locator.get<SymptompsViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(),
        body: Column(
          children: [
            GestureDetector(
                onTap: () {
                  feedingViewmodel.clearTime(); //time sıfırla
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedingPage()));
                },
                child: const CustomImageContainer(image: homeImage1)),
            GestureDetector(
                onTap: () {
                  sleepViewmodel.clearTime();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepPage()));
                },
                child: const CustomImageContainer(image: homeImage2)),
            GestureDetector(
                onTap: () {
                  symptompsViewmodel.clearTime();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SymptompsPage()));
                },
                child: const CustomImageContainer(image: homeImage3)),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

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
        appBar: const CustomHomeAppbar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomStack(informationVeiwmodel: informationVeiwmodel),
              SizedBox(height: displayHeight(context) * 0.08),
              GestureDetector(
                  onTap: () {
                    feedingViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedingPage()));
                  },
                  child: CustomImageContainer(
                      icons: Baby.feed,
                      containerColor: ColorConst.containerFeeding,
                      text: AppLocalizations.of(context)!.feedingAppbar)),
              GestureDetector(
                  onTap: () {
                    sleepViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SleepPage()));
                  },
                  child: CustomImageContainer(
                      icons: Baby.sleep,
                      containerColor: ColorConst.containerSleep,
                      text: AppLocalizations.of(context)!.sleepAppbar)),
              GestureDetector(
                  onTap: () {
                    symptompsViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SymptompsPage()));
                  },
                  child: CustomImageContainer(
                      icons: Baby.symptoms,
                      containerColor: ColorConst.containerSymptopms,
                      text: AppLocalizations.of(context)!.symptomos)),
              GestureDetector(
                  onTap: () {
                    nappyViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NappyPage()));
                  },
                  child: CustomImageContainer(
                      icons: Baby.nappy,
                      containerColor: ColorConst.containerNappy,
                      text: AppLocalizations.of(context)!.nappyAppbar)),
              GestureDetector(
                  onTap: () {
                    vaccineViewmodel.clearTime();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const VaccinePage()));
                  },
                  child: CustomImageContainer(
                      icons: Baby.syringe2,
                      containerColor: ColorConst.containerVaccine,
                      text: AppLocalizations.of(context)!.vaccineAppbar)),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomInformationAlert extends StatelessWidget {
  const CustomInformationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    var informationViewmodel = locator.get<InformationViewModel>();
    var calendarViewmodel = locator.get<CalenderViewModel>();
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    var onboardingViewmodel = locator.get<OnboardingViewmodel>();
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.desicion),
      content: SingleChildScrollView(
        child: ListBody(children: <Widget>[Text(AppLocalizations.of(context)!.sure)]),
      ),
      actions: <Widget>[
        TextButton(
            child: Text(AppLocalizations.of(context)!.cancelText),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        TextButton(
            child: Text(AppLocalizations.of(context)!.deleteInf),
            onPressed: () {
              informationViewmodel.saveIsSeenInformationFalse();
              onboardingViewmodel.saveIsSeenFalse();
              informationViewmodel.clearBaby();
              calendarViewmodel.clearFeeding();
              calendarViewmodel.clearSleep();
              calendarViewmodel.clearSymptomps();
              calendarViewmodel.clearNappy();
              calendarViewmodel.clearVaccine();
              memoriesViewmodel.clearAllMemories();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const MainView();
                  },
                ),
                (Route<dynamic> route) => false,
              );
            }),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomInformationAlert extends StatelessWidget {
  const CustomInformationAlert({super.key});

  @override
  Widget build(BuildContext context) {
    var informationViewmodel = locator.get<InformationViewModel>();
    var calendarViewmodel = locator.get<CalenderViewModel>();
    var memoriesViewmodel = locator.get<MemoriesViewModel>();
    return Observer(
      builder: (context) {
        return AlertDialog(
          title: const Text('Desicion!'),
          content: const SingleChildScrollView(
            child: ListBody(children: <Widget>[Text("Are you sure you want to delete your baby's information?")]),
          ),
          actions: <Widget>[
            TextButton(
                child: const Text(cancelText),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  informationViewmodel.saveIsSeenInformationFalse();
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
                        return const InformationPage();
                      },
                    ),
                    (Route<dynamic> route) => false,
                  );
                }),
          ],
        );
      },
    );
  }
}

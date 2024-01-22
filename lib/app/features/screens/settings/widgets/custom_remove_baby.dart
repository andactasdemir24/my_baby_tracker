import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RemoveBabyWidget extends StatelessWidget {
  const RemoveBabyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var informationViewmodel = locator.get<InformationViewModel>();
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          informationViewmodel.showMyDialog(context);
        },
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.055, vertical: displayHeight(context) * 0.01),
          child: Container(
            height: displayHeight(context) * 0.075,
            width: displayWidth(context) * 0.8878,
            decoration: ShapeDecoration(
              color: annualColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.055, right: displayWidth(context) * 0.04),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remove Baby Informations',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: cred)),
                  Icon(Baby.left, color: settingsIndex),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

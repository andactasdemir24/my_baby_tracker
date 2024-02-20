import 'package:flutter/material.dart';
import 'package:baby_tracker_app/app/app.dart';

class RemoveBabyWidget extends StatelessWidget {
  const RemoveBabyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var informationViewmodel = locator.get<InformationViewModel>();
    return GestureDetector(
      onTap: () {
        informationViewmodel.showMyDialog(context);
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.055, vertical: displayHeight(context) * 0.01),
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: displayHeight(context) * 0.08,
            width: displayWidth(context) * 0.9,
            decoration: ShapeDecoration(
              color: ColorConst.annualColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.removeInf,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.spMin, color: ColorConst.cred)),
                  Icon(
                    Icons.logout_outlined,
                    color: ColorConst.settingsIndex,
                    size: 25.spMin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class VaccinePage extends StatelessWidget {
  const VaccinePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vaccineViewModel = locator.get<VaccineViewModel>();
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.vaccineAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                CustomInformationTextField(
                  onChanged: (p0) => vaccineViewModel.changeVisible(),
                  controller: vaccineViewModel.dateController,
                  hintText: AppLocalizations.of(context)!.vaccineDate,
                  hintStyle: TextStyle(color: ColorConst.settingsIndex),
                  textInputType: TextInputType.none,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onTap: () {
                    vaccineViewModel.selectDate(context, vaccineViewModel.dateController);
                  },
                ),
                CustomDropdownButton(
                    vaccineViewModel: vaccineViewModel,
                    text: AppLocalizations.of(context)!.vaccine,
                    color: ColorConst.settingsIndex),
                CustomNoteTextfield(
                  controller: vaccineViewModel.noteController,
                  onChanged: (p0) => vaccineViewModel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: vaccineViewModel.isButtonVisible,
                      child: CustomButton(
                          text: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: ColorConst.cwhite)),
                          onPressed: () {
                            vaccineViewModel.addVaccine();
                            vaccineViewModel.toggleBlur(context);
                          }),
                    );
                  },
                )
              ],
            )),
            if (vaccineViewModel.isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: ColorConst.cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ],
        );
      }),
    );
  }
}

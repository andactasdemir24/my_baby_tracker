import 'dart:ui';
import 'package:baby_tracker_app/app/features/screens/vaccine/viewmodel/vaccine_viewmodel.dart';
import 'package:baby_tracker_app/app/features/screens/vaccine/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../Informations/widgets/custom_information_textfield.dart';

class VaccinePage extends StatelessWidget {
  const VaccinePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vaccineViewModel = locator.get<VaccineViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: vaccineAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                CustomInformationTextField(
                  onChanged: (p0) => vaccineViewModel.changeVisible(),
                  controller: vaccineViewModel.dateController,
                  hintText: vaccineDate,
                  hintStyle: const TextStyle(color: settingsIndex),
                  textInputType: TextInputType.none,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onTap: () {
                    vaccineViewModel.selectDate(context, vaccineViewModel.dateController);
                  },
                ),
                CustomDropdownButton(vaccineViewModel: vaccineViewModel, text: vaccine, color: settingsIndex),
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
                          text: const Text(save, style: TextStyle(color: cwhite)),
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
                  child: Container(color: cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ],
        );
      }),
    );
  }
}

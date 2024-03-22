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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.vaccineAppbar),
        body: Observer(builder: (context) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        CustomVaccineTextField(
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
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomDropdownButton(
                            vaccineViewModel: vaccineViewModel,
                            text: AppLocalizations.of(context)!.vaccine,
                            color: ColorConst.settingsIndex),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: vaccineViewModel.noteController,
                          onChanged: (p0) => vaccineViewModel.changeVisible(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: displayWidth(context) * 0.065, vertical: displayHeight(context) * 0.01),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(AppLocalizations.of(context)!.informationInfoText,
                                style: TextStyle(color: ColorConst.cblack, fontSize: 13.spMin)),
                          ),
                        ),
                        const Spacer(),
                        Observer(
                          builder: (context) {
                            return Visibility(
                              visible: vaccineViewModel.isButtonVisible,
                              child: CustomButton(
                                  text: Text(AppLocalizations.of(context)!.save,
                                      style: TextStyle(color: ColorConst.cwhite)),
                                  onPressed: () {
                                    vaccineViewModel.addVaccine();
                                    vaccineViewModel.toggleBlur(context);
                                  }),
                            );
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.035),
                      ],
                    ),
                  )
                ],
              ),
              if (vaccineViewModel.isBlurred)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                        color: ColorConst.cblack.withOpacity(0),
                        child: Center(child: Lottie.asset(ImagesConst.lottie))),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

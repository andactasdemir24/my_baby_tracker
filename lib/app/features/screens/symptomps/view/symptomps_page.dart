import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class SymptompsPage extends StatelessWidget {
  const SymptompsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.symptomos),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    symptompsViewmodel.selectTime3(context);
                    symptompsViewmodel.changeVisible();
                  },
                  child: CustomTimePicker(
                      text: symptompsViewmodel.time3 != null
                          ? symptompsViewmodel.time3!.format(context)
                          : AppLocalizations.of(context)!.sympAppbar,
                      color: symptompsViewmodel.time3 != null ? ColorConst.cblack : ColorConst.settingsIndex),
                ),
                CustomSymptompsList(
                    text: Text(
                  symptompsViewmodel.selectedIndices.isEmpty
                      ? AppLocalizations.of(context)!.symptomos
                      : symptompsViewmodel.selectedIndices.map((index) => index.name).join(', '),
                  style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: symptompsViewmodel.selectedIndices.isEmpty ? ColorConst.settingsIndex : ColorConst.cblack),
                )),
                CustomNoteTextfield(
                  controller: symptompsViewmodel.noteController,
                  onChanged: (p0) => symptompsViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: symptompsViewmodel.isButtonVisible3,
                      child: CustomButton(
                        text:
                            Text(AppLocalizations.of(context)!.save, style:  TextStyle(color: ColorConst.cwhite)),
                        onPressed: () {
                          symptompsViewmodel.onSave();
                          symptompsViewmodel.addSymptomps();
                          symptompsViewmodel.toggleBlur4(context);
                        },
                      ),
                    );
                  },
                )
              ],
            )),
            if (symptompsViewmodel.isBlurred4)
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

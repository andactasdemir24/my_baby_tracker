import 'dart:ui';
import 'package:baby_tracker_app/app/features/screens/sleep/viewmodel/sleep_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/custom_button.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sleepViewmodel = locator.get<SleepViewModel>();

    return Scaffold(
        appBar: const CustomAppbar(appbarText: sleepAppbar),
        body: Observer(builder: (context) {
          return Stack(children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    sleepViewmodel.selectTime1(context);
                    sleepViewmodel.changeVisible();
                  },
                  child: CustomTimePicker(
                    text: sleepViewmodel.time1 != null ? sleepViewmodel.time1!.format(context) : feelSleep,
                    color: sleepViewmodel.time1 != null ? cblack : settingsIndex,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      sleepViewmodel.selectTime2(context);
                      sleepViewmodel.changeVisible();
                    },
                    child: CustomTimePicker(
                      text: sleepViewmodel.time2 != null ? sleepViewmodel.time2!.format(context) : wokeUp,
                      color: sleepViewmodel.time2 != null ? cblack : settingsIndex,
                    ),
                  ),
                ),
                CustomNoteTextfield(
                  controller: sleepViewmodel.noteController,
                  onChanged: (p0) => sleepViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: sleepViewmodel.isButtonVisible2,
                      child: CustomButton(
                        text: const Text(save, style: TextStyle(color: cwhite)),
                        onPressed: () {
                          sleepViewmodel.addSleep();
                          sleepViewmodel.toggleBlur2(context);
                        },
                      ),
                    );
                  },
                )
              ],
            )),
            if (sleepViewmodel.isBlurred2)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ]);
        }));
  }
}

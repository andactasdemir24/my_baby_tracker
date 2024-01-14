import 'dart:ui';
import 'package:baby_tracker_app/app/features/screens/nappy/viewmodel/nappy_viewmodel.dart';
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
import '../widgets/custom_nappy_container.dart';

class NappyPage extends StatelessWidget {
  const NappyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nappyViewmodel = locator.get<NappyViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: nappyAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    nappyViewmodel.selectTime4(context);
                    nappyViewmodel.changeVisibleNappy();
                  },
                  child: CustomTimePicker(
                      text: nappyViewmodel.time4 != null ? nappyViewmodel.time4!.format(context) : nappyTime,
                      color: nappyViewmodel.time4 != null ? cblack : settingsIndex),
                ),
                SizedBox(height: displayHeight(context) * 0.03),
                SizedBox(
                  width: displayWidth(context) * 0.85,
                  child: const Text(
                    nappyStatus,
                    style: TextStyle(color: cblack, fontSize: 15.5, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomNappyList(
                    text: Text(
                  nappyViewmodel.selectedIndicess.isEmpty
                      ? nappyAppbar
                      : nappyViewmodel.selectedIndicess.map((index) => index.name).join(', '),
                  style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: nappyViewmodel.selectedIndicess.isEmpty ? settingsIndex : cblack),
                )),
                SizedBox(height: displayHeight(context) * 0.02),
                CustomNoteTextfield(
                  controller: nappyViewmodel.noteController,
                  onChanged: (p0) => nappyViewmodel.changeVisibleNappy(),
                ),
                SizedBox(height: displayHeight(context) * 0.15),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: nappyViewmodel.isButtonVisible4,
                      child: CustomButton(
                        text: const Text(save, style: TextStyle(color: cwhite)),
                        onPressed: () {
                          nappyViewmodel.onSave();
                          nappyViewmodel.addNappy();
                          nappyViewmodel.toggleBlur5(context);
                        },
                      ),
                    );
                  },
                )
              ],
            )),
            if (nappyViewmodel.isBlurred)
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

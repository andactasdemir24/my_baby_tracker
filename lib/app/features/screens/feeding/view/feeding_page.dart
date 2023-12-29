// ignore_for_file: public_member_api_docs, sort_constructors_first
// feeding_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/viewmodel/feeding_viewmodel.dart';

import '../../../../core/components/custom_widgets/amount_textfield.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

class FeedingPage extends StatelessWidget {
  const FeedingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedingViewModel feedingViewModel = locator.get<FeedingViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: feedingAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    feedingViewModel.selectTime(context);
                    feedingViewModel.changeVisible();
                  },
                  child: CustomTimePicker(
                    text: feedingViewModel.time != null ? feedingViewModel.time!.format(context) : time,
                    color: feedingViewModel.time != null ? cblack : settingsIndex,
                  ),
                ),
                AmountTextField(controller: feedingViewModel.amountController),
                CustomNoteTextfield(
                  controller: feedingViewModel.noteController,
                  onChanged: (p0) => feedingViewModel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return Visibility(
                      visible: feedingViewModel.isButtonVisible,
                      child: CustomButton(
                          text: const Text(save, style: TextStyle(color: cwhite)),
                          onPressed: () {
                            feedingViewModel.addFeeding();
                            feedingViewModel.toggleBlur(context);
                          }),
                    );
                  },
                )
              ],
            )),
            if (feedingViewModel.isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      color: cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ],
        );
      }),
    );
  }
}

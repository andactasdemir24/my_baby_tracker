// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import 'package:baby_tracker_app/app/features/screens/sleep/viewmodel/sleep_viewmodel.dart';

import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/custom_button.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

class SleepPageEdit extends StatefulWidget {
  const SleepPageEdit({
    Key? key,
    required this.id,
    required this.feelSleep,
    required this.wokeUp,
    required this.note,
  }) : super(key: key);

  final String id;
  final DateTime feelSleep;
  final DateTime wokeUp;
  final String note;

  @override
  State<SleepPageEdit> createState() => _SleepPageEditState();
}

class _SleepPageEditState extends State<SleepPageEdit> {
  final TextEditingController _noteController = TextEditingController();
  final sleepViewmodel = locator.get<SleepViewModel>();

  @override
  void initState() {
    _noteController.text = widget.note;
    super.initState();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    text: sleepViewmodel.time1 != null
                        ? sleepViewmodel.time1!.format(context)
                        : '${widget.feelSleep.hour.toString()}:${widget.feelSleep.minute.toString()}',
                    color: cblack,
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
                      text: sleepViewmodel.time2 != null
                          ? sleepViewmodel.time2!.format(context)
                          : '${widget.wokeUp.hour.toString()}:${widget.wokeUp.minute.toString()}',
                      color: cblack,
                    ),
                  ),
                ),
                CustomNoteTextfield(
                  controller: _noteController,
                  onChanged: (p0) => sleepViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return CustomButton(
                      text: const Text(update, style: TextStyle(color: cwhite)),
                      onPressed: () {
                        var value = Sleep(
                            id: widget.id,
                            fellSleep: widget.feelSleep,
                            wokeUp: widget.wokeUp,
                            text: _noteController.text);
                        sleepViewmodel.updateSleep(value);
                        sleepViewmodel.toggleBlur2(context);
                      },
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

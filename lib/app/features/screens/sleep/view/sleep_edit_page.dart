// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class SleepPageEdit extends StatefulWidget {
  const SleepPageEdit({
    Key? key,
    required this.id,
    required this.feelSleep,
    required this.wokeUp,
    required this.note,
    required this.createdTime,
  }) : super(key: key);

  final String id;
  final DateTime feelSleep;
  final DateTime wokeUp;
  final String note;
  final DateTime createdTime;

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
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.sleepAppbar),
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
                    color: ColorConst.cblack,
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
                      color: ColorConst.cblack,
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
                      text:
                          Text(AppLocalizations.of(context)!.update, style:  TextStyle(color: ColorConst.cwhite)),
                      onPressed: () {
                        var value = Sleep(
                          id: widget.id,
                          fellSleep: widget.feelSleep,
                          wokeUp: widget.wokeUp,
                          text: _noteController.text,
                          createdTime: widget.createdTime,
                        );
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
                  child: Container(color: ColorConst.cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ]);
        }));
  }
}

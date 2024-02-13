import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class SleepPage extends StatelessWidget {
  const SleepPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sleepViewmodel = locator.get<SleepViewModel>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.sleepAppbar),
          body: Observer(builder: (context) {
            return Stack(children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
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
                                : AppLocalizations.of(context)!.feelSleep,
                            color: sleepViewmodel.time1 != null ? ColorConst.cblack : ColorConst.settingsIndex,
                          ),
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        GestureDetector(
                          onTap: () {
                            sleepViewmodel.selectTime2(context);
                            sleepViewmodel.changeVisible();
                          },
                          child: CustomTimePicker(
                            text: sleepViewmodel.time2 != null
                                ? sleepViewmodel.time2!.format(context)
                                : AppLocalizations.of(context)!.wokeUp,
                            color: sleepViewmodel.time2 != null ? ColorConst.cblack : ColorConst.settingsIndex,
                          ),
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: sleepViewmodel.noteController,
                          onChanged: (p0) => sleepViewmodel.changeVisible(),
                        ),
                        const Spacer(),
                        Observer(
                          builder: (context) {
                            return Visibility(
                              visible: sleepViewmodel.isButtonVisible2,
                              child: CustomButton(
                                text: Text(AppLocalizations.of(context)!.save,
                                    style: TextStyle(color: ColorConst.cwhite)),
                                onPressed: () {
                                  sleepViewmodel.addSleep();
                                  sleepViewmodel.toggleBlur2(context);
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.03),
                      ],
                    ),
                  )
                ],
              ),
              if (sleepViewmodel.isBlurred2)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                        color: ColorConst.cblack.withOpacity(0),
                        child: Center(child: Lottie.asset(ImagesConst.lottie))),
                  ),
                ),
            ]);
          })),
    );
  }
}

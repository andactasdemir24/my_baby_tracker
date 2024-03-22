// ignore_for_file: public_member_api_docs, sort_constructors_first
// feeding_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class FeedingPage extends StatelessWidget {
  const FeedingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedingViewModel feedingViewModel = locator.get<FeedingViewModel>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.feedingAppbar),
        body: Observer(builder: (context) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            feedingViewModel.selectTime(context);
                            feedingViewModel.changeVisible();
                          },
                          child: CustomTimePicker(
                            text: feedingViewModel.time != null
                                ? feedingViewModel.time!.format(context)
                                : AppLocalizations.of(context)!.time,
                            color: feedingViewModel.time != null ? ColorConst.cblack : ColorConst.settingsIndex,
                          ),
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        AmountTextField(controller: feedingViewModel.amountController),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: feedingViewModel.noteController,
                          onChanged: (p0) => feedingViewModel.changeVisible(),
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
                              visible: feedingViewModel.isButtonVisible,
                              child: CustomButton(
                                  text: Text(AppLocalizations.of(context)!.save,
                                      style: TextStyle(color: ColorConst.cwhite)),
                                  onPressed: () {
                                    feedingViewModel.addFeeding();
                                    feedingViewModel.toggleBlur(context);
                                  }),
                            );
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.03),
                      ],
                    ),
                  )
                ],
              ),
              if (feedingViewModel.isBlurred)
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

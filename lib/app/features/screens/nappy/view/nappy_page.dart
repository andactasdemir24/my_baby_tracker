import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class NappyPage extends StatelessWidget {
  const NappyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nappyViewmodel = locator.get<NappyViewModel>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.nappyAppbar),
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
                            nappyViewmodel.selectTime4(context);
                            nappyViewmodel.changeVisibleNappy();
                          },
                          child: CustomTimePicker(
                              text: nappyViewmodel.time4 != null
                                  ? nappyViewmodel.time4!.format(context)
                                  : AppLocalizations.of(context)!.nappyTime,
                              color: nappyViewmodel.time4 != null ? ColorConst.cblack : ColorConst.settingsIndex),
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNappyList(
                            text: Text(
                          nappyViewmodel.selectedIndicess.isEmpty
                              ? AppLocalizations.of(context)!.nappyAppbar
                              : nappyViewmodel.selectedIndicess.map((index) => index.name).join(', '),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: nappyViewmodel.selectedIndicess.isEmpty
                                  ? ColorConst.settingsIndex
                                  : ColorConst.cblack),
                        )),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: nappyViewmodel.noteController,
                          onChanged: (p0) => nappyViewmodel.changeVisibleNappy(),
                        ),
                        const Spacer(),
                        Observer(
                          builder: (context) {
                            return Visibility(
                              visible: nappyViewmodel.isButtonVisible4,
                              child: CustomButton(
                                text: Text(AppLocalizations.of(context)!.save,
                                    style: TextStyle(color: ColorConst.cwhite)),
                                onPressed: () {
                                  nappyViewmodel.onSave();
                                  nappyViewmodel.addNappy();
                                  nappyViewmodel.toggleBlur5(context);
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.035),
                      ],
                    ),
                  )
                ],
              ),
              if (nappyViewmodel.isBlurred)
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

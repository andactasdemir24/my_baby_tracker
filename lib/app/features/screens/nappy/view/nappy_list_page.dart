import 'dart:ui';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/features/screens/nappy/viewmodel/nappy_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/custom_nappy_list.dart';

class NappyList extends StatelessWidget {
  const NappyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nappyViewmodel = locator.get<NappyViewModel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: nappyAppbar),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: displayHeight(context) * 0.02,
                  mainAxisSpacing: displayWidth(context) * 0.03,
                ),
                shrinkWrap: true,
                itemCount: nappyViewmodel.nappyStatusList.length,
                itemBuilder: (BuildContext context, index) {
                  var nappy = nappyViewmodel.nappyStatusList[index];
                  return Observer(builder: (_) {
                    return CustomNappyListContainer(
                      nappyViewmodel: nappyViewmodel,
                      nappy: nappy,
                    );
                  });
                },
              ),
              if (nappyViewmodel.isBlurred)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(color: cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: nappyViewmodel.selectedIndicess.isNotEmpty,
          child: CustomButton(
              text: const Text(save, style: TextStyle(color: cwhite)),
              onPressed: () => nappyViewmodel.toggleBlur5(context)),
        );
      }),
    );
  }
}

import 'dart:ui';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../viewmodel/symptomps_viewmodel.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/custom_symptomps_list.dart';

class SymptompsList extends StatelessWidget {
  const SymptompsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    return Scaffold(
      appBar: const CustomAppbar(appbarText: symptomos),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: displayHeight(context) * 0.02,
                  mainAxisSpacing: displayWidth(context) * 0.03,
                ),
                shrinkWrap: true,
                itemCount: symptompsViewmodel.symptompsList.length,
                itemBuilder: (BuildContext context, index) {
                  var symptomp = symptompsViewmodel.symptompsList[index];
                  return Observer(builder: (_) {
                    return CustomSymptompsListContainer(
                      symptompsViewmodel: symptompsViewmodel,
                      symptomp: symptomp,
                    );
                  });
                },
              ),
              if (symptompsViewmodel.isBlurred3)
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
          visible: symptompsViewmodel.selectedIndices.isNotEmpty,
          child: CustomButton(
              text: const Text(save, style: TextStyle(color: cwhite)),
              onPressed: () => symptompsViewmodel.toggleBlur3(context)),
        );
      }),
    );
  }
}

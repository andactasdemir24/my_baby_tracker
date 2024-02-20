import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class SymptompsList extends StatelessWidget {
  const SymptompsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final symptompsViewmodel = locator.get<SymptompsViewmodel>();
    symptompsViewmodel.startSelection();
    symptompsViewmodel.fillList(context);
    return Scaffold(
      appBar: CustomAppbar(
          appbarText: AppLocalizations.of(context)!.symptomos,
          leading: GestureDetector(
              onTap: () {
                symptompsViewmodel.onBack();
                Navigator.of(context).pop();
                symptompsViewmodel.changeVisible();
              },
              child: const Icon(Icons.arrow_back))),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: displayHeight(context) * 0.02,
                  mainAxisSpacing: displayWidth(context) * 0.03,
                ),
                shrinkWrap: true,
                itemCount: symptompsViewmodel.symptompsList.length,
                itemBuilder: (BuildContext context, index) {
                  var symptomp = symptompsViewmodel.symptompsList[index];
                  return CustomSymptompsListContainer(
                    symptompsViewmodel: symptompsViewmodel,
                    symptomp: symptomp,
                  );
                },
              ),
              if (symptompsViewmodel.isBlurred3)
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
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: symptompsViewmodel.selectedIndices.isNotEmpty,
          child: CustomButton(
              text: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: ColorConst.cwhite)),
              onPressed: () => symptompsViewmodel.toggleBlur3(context)),
        );
      }),
      bottomNavigationBar: SizedBox(height: displayHeight(context) * 0.05),
    );
  }
}

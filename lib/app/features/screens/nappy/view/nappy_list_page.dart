import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class NappyList extends StatelessWidget {
  const NappyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nappyViewmodel = locator.get<NappyViewModel>();
    nappyViewmodel.fillList(context);
    return Scaffold(
      appBar: CustomAppbar(
          appbarText: AppLocalizations.of(context)!.nappyAppbar,
          leading: GestureDetector(
              onTap: () {
                nappyViewmodel.onBack();
                Navigator.of(context).pop();
                nappyViewmodel.changeVisibleNappy();
              },
              child: const Icon(Icons.arrow_back))),
      body: Observer(
        builder: (context) {
          return Stack(
            children: [
              GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: displayHeight(context) * 0.02,
                  mainAxisSpacing: displayWidth(context) * 0.03,
                ),
                shrinkWrap: true,
                itemCount: nappyViewmodel.nappyStatusList.length,
                itemBuilder: (BuildContext context, index) {
                  var nappy = nappyViewmodel.nappyStatusList[index];
                  return CustomNappyListContainer(
                    nappyViewmodel: nappyViewmodel,
                    nappy: nappy,
                  );
                },
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
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Observer(builder: (_) {
        return Visibility(
          visible: nappyViewmodel.selectedIndicess.isNotEmpty,
          child: CustomButton(
              text: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: ColorConst.cwhite)),
              onPressed: () => nappyViewmodel.toggleBlur5(context)),
        );
      }),
      bottomNavigationBar: SizedBox(height: displayHeight(context) * 0.05),
    );
  }
}

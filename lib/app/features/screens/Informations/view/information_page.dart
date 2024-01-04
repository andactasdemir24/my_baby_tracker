import 'dart:ui';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/Informations/widgets/custom_gender_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../widgets/custom_information_textfield.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../viewmodel/information_viewmodel.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final informationviewmodel = locator.get<InformationViewModel>();
    return Scaffold(
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    AspectRatio(aspectRatio: displayHeight(context) * 0.01),
                    Observer(
                      builder: (context) {
                        return GestureDetector(
                            onTap: () {
                              informationviewmodel.pickImageFromGalery();
                              informationviewmodel.changeVisible();
                            },
                            child: ClipRRect(
                              child: informationviewmodel.selectedImage != null
                                  ? CircleAvatar(
                                      maxRadius: 75,
                                      backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                      child: Container(
                                        decoration: const ShapeDecoration(
                                          shape: OvalBorder(
                                            side: BorderSide(width: 2, color: pickerColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Image.asset(picker, height: displayHeight(context) * 0.2),
                            ));
                      },
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.025),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: displayHeight(context) * 0.04,
                      ),
                      shrinkWrap: true,
                      itemCount: informationviewmodel.genderList.length,
                      itemBuilder: (BuildContext context, index) {
                        var gender = informationviewmodel.genderList[index];
                        return Observer(builder: (_) {
                          return CustomGenderListContainer(
                            informationViewModel: informationviewmodel,
                            gender: gender,
                          );
                        });
                      },
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.05),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.nameController,
                        textInputType: TextInputType.name,
                        hintText: babyFullName),
                    CustomInformationTextField(
                      onChanged: (p0) => informationviewmodel.changeVisible(),
                      controller: informationviewmodel.birthDateController,
                      hintText: babyBirthDate,
                      textInputType: TextInputType.none,
                      onTap: () {
                        informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                      },
                    ),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.weightController,
                        textInputType: TextInputType.number,
                        hintText: babyWeight),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.heightController,
                        textInputType: TextInputType.number,
                        hintText: babyHeight),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.015),
                    Observer(builder: (context) {
                      return Visibility(
                        visible: informationviewmodel.isButtonVisibleInf,
                        child: CustomButton(
                          text: const Text(babyContinue, style: TextStyle(color: cwhite)),
                          onPressed: () {
                            informationviewmodel.saveIsSeenInformation();
                            informationviewmodel.addInformation();
                            informationviewmodel.toggleBlur(context);
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            if (informationviewmodel.isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                ),
              ),
          ],
        );
      }),
    );
  }
}

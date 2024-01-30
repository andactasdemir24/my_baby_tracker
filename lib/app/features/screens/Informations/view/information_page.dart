import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final informationviewmodel = locator.get<InformationViewModel>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Observer(builder: (context) {
          return Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
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
                                        maxRadius: 75.r,
                                        backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            shape: OvalBorder(
                                              side: BorderSide(width: 2.w, color: ColorConst.feedindIconColor),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Image.asset(picker, height: displayHeight(context) * 0.2),
                              ));
                        },
                      ),
                      SizedBox(height: displayHeight(context) * 0.02),
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 90.w),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: displayWidth(context) * 0.2,
                            crossAxisSpacing: displayHeight(context) * 0.03,
                            mainAxisExtent: displayHeight(context) * 0.1),
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
                      SizedBox(height: displayHeight(context) * 0.015),
                      CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.nameController,
                        textInputType: TextInputType.name,
                        hintText: AppLocalizations.of(context)!.babyFullName,
                        hintStyle: TextStyle(color: ColorConst.settingsIndex),
                        icon: const Icon(Baby.baby),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(25),
                          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-ZçÇşŞöÖüÜıİ\s]*$'))
                        ],
                      ),
                      CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.birthDateController,
                        hintText: AppLocalizations.of(context)!.babyBirthDate,
                        hintStyle: TextStyle(color: ColorConst.settingsIndex),
                        textInputType: TextInputType.none,
                        icon: const Icon(Baby.birthdaycake),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        onTap: () {
                          informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                        },
                      ),
                      CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.weightController,
                        textInputType: TextInputType.number,
                        hintText: AppLocalizations.of(context)!.babyWeight,
                        hintStyle: TextStyle(color: ColorConst.settingsIndex),
                        icon: const Icon(Baby.weight),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                      ),
                      CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.heightController,
                        textInputType: TextInputType.number,
                        hintText: AppLocalizations.of(context)!.babyHeight,
                        hintStyle: TextStyle(color: ColorConst.settingsIndex),
                        icon: const Icon(Icons.height),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                      ),
                      SizedBox(height: displayHeight(context) * 0.05),
                      Observer(builder: (context) {
                        return Visibility(
                          visible: informationviewmodel.isButtonVisibleInf,
                          child: CustomButton(
                            text: Text(AppLocalizations.of(context)!.babyContinue,
                                style: TextStyle(color: ColorConst.cwhite)),
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
                    child:
                        Container(color: ColorConst.cblack.withOpacity(0), child: Center(child: Lottie.asset(lottie))),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

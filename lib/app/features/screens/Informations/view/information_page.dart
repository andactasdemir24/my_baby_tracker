import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final informationviewmodel = locator.get<InformationViewModel>();
    informationviewmodel.fillList(context);
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(toolbarHeight: 0, backgroundColor: ColorConst.bg),
          body: SingleChildScrollView(
            child: GestureDetector(
              child: Observer(
                builder: (context) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          Observer(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  informationviewmodel.pickImageFromGalery();
                                  informationviewmodel.changeVisible();
                                },
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      child: informationviewmodel.selectedImage != null
                                          ? CircleAvatar(
                                              maxRadius: 70.r,
                                              backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                              child: Container(
                                                decoration: ShapeDecoration(
                                                  shape: OvalBorder(
                                                    side: BorderSide(width: 2, color: ColorConst.borderSideColor),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Image.asset(ImagesConst.picker,
                                              height: displayHeight(context) * 0.2, semanticLabel: "Profile picture"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: displayHeight(context) * 0.01),
                          GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.2),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: displayWidth(context) * 0.05,
                              mainAxisExtent: displayHeight(context) * 0.12,
                            ),
                            shrinkWrap: true,
                            itemCount: informationviewmodel.genderList.length,
                            itemBuilder: (BuildContext context, index) {
                              var gender = informationviewmodel.genderList[index];
                              return CustomGenderListContainer(
                                informationViewModel: informationviewmodel,
                                gender: gender,
                              );
                            },
                          ),
                          SizedBox(height: displayHeight(context) * 0.01),
                          CustomInformationTextField(
                            onChanged: (p0) => informationviewmodel.changeVisible(),
                            controller: informationviewmodel.nameController,
                            labelText: Text(AppLocalizations.of(context)!.babyFullName,
                                style: TextStyle(
                                    color: ColorConst.settingsIndex, fontSize: 18.spMin, fontWeight: FontWeight.bold)),
                            icon: Icon(Baby.baby, size: 16.spMin),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(25),
                              FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-ZçÇşŞöÖüÜıİ\s]*$')),
                            ],
                          ),
                          CustomInformationTextField(
                            onChanged: (p0) => informationviewmodel.changeVisible(),
                            controller: informationviewmodel.birthDateController,
                            labelText: Text(AppLocalizations.of(context)!.babyBirthDate,
                                style: TextStyle(
                                    color: ColorConst.settingsIndex, fontSize: 18.spMin, fontWeight: FontWeight.bold)),
                            textInputType: TextInputType.none,
                            icon: Icon(Baby.birthdaycake, size: 16.spMin),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            onTap: () {
                              informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                            },
                          ),
                          CustomInformationTextField(
                            onChanged: (p0) => informationviewmodel.changeVisible(),
                            controller: informationviewmodel.weightController,
                            textInputType: TextInputType.number,
                            labelText: Text(AppLocalizations.of(context)!.babyWeight,
                                style: TextStyle(
                                    color: ColorConst.settingsIndex, fontSize: 18.spMin, fontWeight: FontWeight.bold)),
                            icon: Icon(Baby.weight, size: 16.spMin),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                          ),
                          CustomInformationTextField(
                            onChanged: (p0) => informationviewmodel.changeVisible(),
                            controller: informationviewmodel.heightController,
                            textInputType: TextInputType.number,
                            labelText: Text(AppLocalizations.of(context)!.babyHeight,
                                style: TextStyle(
                                    color: ColorConst.settingsIndex, fontSize: 18.spMin, fontWeight: FontWeight.bold)),
                            icon: Icon(Icons.height, size: 16.spMin),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: displayWidth(context) * 0.07, vertical: displayHeight(context) * 0.01),
                            child: Text(AppLocalizations.of(context)!.informationInfoText,
                                style: TextStyle(color: ColorConst.cblack, fontSize: 13.spMin)),
                          )
                        ],
                      ),
                      if (informationviewmodel.isBlurred)
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              color: ColorConst.cblack.withOpacity(0),
                              child: Center(child: Lottie.asset(ImagesConst.lottie)),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Observer(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: 5),
                child: Visibility(
                  visible: informationviewmodel.isButtonVisibleInf,
                  child: CustomButton(
                    text: Text(AppLocalizations.of(context)!.babyContinue, style: TextStyle(color: ColorConst.cwhite)),
                    onPressed: () {
                      informationviewmodel.saveIsSeenInformation();
                      informationviewmodel.addInformation();
                      informationviewmodel.toggleBlur(context);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

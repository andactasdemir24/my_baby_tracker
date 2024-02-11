import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.id, this.image, this.fullname, this.birthDate, this.weight, this.height})
      : super(key: key);

  final String? id;
  final String? image;
  final String? fullname;
  final String? birthDate;
  final int? weight;
  final int? height;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final informationviewmodel = locator.get<InformationViewModel>();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      informationviewmodel.init();
      if (widget.image != null) {
        informationviewmodel.selectedImage = File(widget.image!);
      }
      informationviewmodel.nameController.text = widget.fullname ?? '';
      informationviewmodel.birthDateController.text = widget.birthDate ?? '';
      informationviewmodel.weightController.text = widget.weight.toString();
      informationviewmodel.heightController.text = widget.height.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: displayHeight(context) * 0.05),
                  CustomEditButton(informationviewmodel: informationviewmodel),
                  Observer(
                    builder: (context) {
                      return informationviewmodel.isEdit
                          ? CustomPicker(informationviewmodel: informationviewmodel)
                          : ClipRRect(
                              child: informationviewmodel.selectedImage != null
                                  ? CircleAvatar(
                                      maxRadius: 70.r,
                                      backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          shape: OvalBorder(
                                            side: BorderSide(width: 2, color: ColorConst.annualColor),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Image.asset(ImagesConst.picker, height: displayHeight(context) * 0.2),
                            );
                    },
                  ),
                  SizedBox(height: displayHeight(context) * 0.03),
                  CustomInformationTextField(
                    controller: informationviewmodel.nameController,
                    textInputType: TextInputType.name,
                    hintText: AppLocalizations.of(context)!.babyFullName,
                    hintStyle: TextStyle(color: ColorConst.settingsIndex),
                    icon: Icon(Baby.baby,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.mainIconColor,
                        size: 16.spMin),
                    readOnly: !informationviewmodel.isEdit,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.cblack),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(25),
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-ZçÇşŞöÖüÜıİ\s]*$'))
                    ],
                  ),
                  CustomInformationTextField(
                      controller: informationviewmodel.birthDateController,
                      hintText: AppLocalizations.of(context)!.babyBirthDate,
                      hintStyle: TextStyle(color: ColorConst.settingsIndex),
                      textInputType: TextInputType.none,
                      icon: Icon(Baby.birthdaycake,
                          color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.mainIconColor,
                          size: 16.spMin),
                      readOnly: !informationviewmodel.isEdit,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.cblack),
                      onTap: informationviewmodel.isEdit
                          ? () {
                              informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                            }
                          : null),
                  CustomInformationTextField(
                    controller: informationviewmodel.weightController,
                    textInputType: TextInputType.number,
                    hintText: AppLocalizations.of(context)!.babyWeight,
                    hintStyle: TextStyle(color: ColorConst.settingsIndex),
                    icon: Icon(Baby.weight,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.mainIconColor,
                        size: 16.spMin),
                    readOnly: !informationviewmodel.isEdit,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.cblack),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                  ),
                  CustomInformationTextField(
                    controller: informationviewmodel.heightController,
                    textInputType: TextInputType.number,
                    hintText: AppLocalizations.of(context)!.babyHeight,
                    hintStyle: TextStyle(color: ColorConst.settingsIndex),
                    icon: Icon(Icons.height,
                        size: 16.spMin,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.mainIconColor),
                    readOnly: !informationviewmodel.isEdit,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: !informationviewmodel.isEdit ? ColorConst.shade500 : ColorConst.cblack),
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{1,3}$'))],
                  ),
                  SizedBox(height: displayHeight(context) * 0.1),
                  Observer(builder: (context) {
                    return Visibility(
                      visible: informationviewmodel.isEdit,
                      child: CustomButton(
                        text:
                            Text(AppLocalizations.of(context)!.babyUpdate, style: TextStyle(color: ColorConst.cwhite)),
                        onPressed: () {
                          if (informationviewmodel.areFieldsFilled) {
                            // Update the information
                            var value = Information(
                              id: informationviewmodel.selectedInformation!.id,
                              image: informationviewmodel.selectedImage?.path,
                              genderList: informationviewmodel.genderList,
                              fullname: informationviewmodel.nameController.text,
                              birthDate: informationviewmodel.birthDateController.text,
                              weight: int.parse(informationviewmodel.weightController.text),
                              height: int.parse(informationviewmodel.heightController.text),
                              selectedGender: informationviewmodel.selectedInformation?.selectedGender,
                            );
                            informationviewmodel.updateInformation(value);
                            informationviewmodel.toggleBlur(context);
                            informationviewmodel.isEditControl();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(CustomSnackbar.show(context));
                          }
                        },
                      ),
                    );
                  }),
                  SizedBox(height: displayHeight(context) * 0.01),
                ],
              ),
            ),
            if (informationviewmodel.isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                      color: ColorConst.cblack.withOpacity(0), child: Center(child: Lottie.asset(ImagesConst.lottie))),
                ),
              ),
          ],
        );
      }),
    );
  }
}

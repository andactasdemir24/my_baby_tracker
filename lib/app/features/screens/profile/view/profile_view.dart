import 'dart:io';
import 'dart:ui';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/core/hive/model/information_model.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../Informations/viewmodel/information_viewmodel.dart';
import '../../Informations/widgets/custom_information_textfield.dart';
import '../widgets/custom_edit_button.dart';
import '../widgets/custom_picker.dart';

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
    informationviewmodel.init();
    if (widget.image != null) {
      informationviewmodel.selectedImage = File(widget.image!);
    }
    informationviewmodel.nameController.text = widget.fullname ?? '';
    informationviewmodel.birthDateController.text = widget.birthDate ?? '';
    informationviewmodel.weightController.text = widget.weight.toString();
    informationviewmodel.heightController.text = widget.height.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    AspectRatio(aspectRatio: displayHeight(context) * 0.01),
                    CustomEditButton(informationviewmodel: informationviewmodel),
                    Observer(
                      builder: (context) {
                        return informationviewmodel.isEdit
                            ? CustomPicker(informationviewmodel: informationviewmodel)
                            : ClipRRect(
                                child: informationviewmodel.selectedImage != null
                                    ? CircleAvatar(
                                        maxRadius: 75.r,
                                        backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            shape: OvalBorder(
                                              side: BorderSide(width: 2.w, color: annualColor),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Image.asset(picker, height: displayHeight(context) * 0.2),
                              );
                      },
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.05),
                    CustomInformationTextField(
                      controller: informationviewmodel.nameController,
                      textInputType: TextInputType.name,
                      hintText: babyFullName,
                      icon: Icon(Baby.baby, color: !informationviewmodel.isEdit ? shade500 : mainIconColor, size: 20),
                      readOnly: !informationviewmodel.isEdit,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: !informationviewmodel.isEdit ? shade500 : cblack),
                    ),
                    CustomInformationTextField(
                        controller: informationviewmodel.birthDateController,
                        hintText: babyBirthDate,
                        textInputType: TextInputType.none,
                        icon: Icon(Baby.birthdaycake,
                            color: !informationviewmodel.isEdit ? shade500 : mainIconColor, size: 20),
                        readOnly: !informationviewmodel.isEdit,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: !informationviewmodel.isEdit ? shade500 : cblack),
                        onTap: informationviewmodel.isEdit
                            ? () {
                                informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                              }
                            : null),
                    CustomInformationTextField(
                      controller: informationviewmodel.weightController,
                      textInputType: TextInputType.number,
                      hintText: babyWeight,
                      icon: Icon(Baby.weight, color: !informationviewmodel.isEdit ? shade500 : mainIconColor, size: 20),
                      readOnly: !informationviewmodel.isEdit,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: !informationviewmodel.isEdit ? shade500 : cblack),
                    ),
                    CustomInformationTextField(
                      controller: informationviewmodel.heightController,
                      textInputType: TextInputType.number,
                      hintText: babyHeight,
                      icon: Icon(Icons.height, color: !informationviewmodel.isEdit ? shade500 : mainIconColor),
                      readOnly: !informationviewmodel.isEdit,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: !informationviewmodel.isEdit ? shade500 : cblack),
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.015),
                    Observer(builder: (context) {
                      return Visibility(
                        visible: informationviewmodel.isEdit,
                        child: CustomButton(
                          text: const Text(babyUpdate, style: TextStyle(color: cwhite)),
                          onPressed: () {
                            var value = Information(
                              id: informationviewmodel.selectedInformation!.id,
                              image: informationviewmodel.selectedImage?.path,
                              genderList: informationviewmodel.genderList,
                              fullname: informationviewmodel.nameController.text,
                              birthDate: informationviewmodel.birthDateController.text,
                              weight: int.parse(informationviewmodel.weightController.text),
                              height: int.parse(informationviewmodel.heightController.text),
                              selectedGender:
                                  informationviewmodel.selectedInformation?.selectedGender, // Yeni eklenen alan
                            );
                            informationviewmodel.updateInformation(value);
                            informationviewmodel.toggleBlur(context);
                            informationviewmodel.isEditControl();
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

import 'dart:ui';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/babyInformations/viewmodel/information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/components/custom_widgets/custom_information_textfield.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

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
                              informationviewmodel.changeVisible();
                              informationviewmodel.pickImageFromGalery();
                            },
                            child: ClipRRect(
                              child: informationviewmodel.selectedImage != null
                                  ? CircleAvatar(
                                      maxRadius: 75,
                                      backgroundImage: FileImage(informationviewmodel.selectedImage!),
                                      child: Container(
                                        decoration: const ShapeDecoration(
                                          shape: OvalBorder(
                                            side: BorderSide(width: 2, color: Color(0xff547eff)),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Image.asset('assets/images/picker.png', height: displayHeight(context) * 0.2),
                            ));
                      },
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/girlbw.png', height: displayHeight(context) * 0.06),
                        Image.asset('assets/images/boybw.png', height: displayHeight(context) * 0.06),
                      ],
                    ),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.02),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.nameController,
                        hintText: babyFullName),
                    CustomInformationTextField(
                      onChanged: (p0) => informationviewmodel.changeVisible(),
                      controller: informationviewmodel.birthDateController,
                      hintText: babyBirthDate,
                      onTap: () {
                        informationviewmodel.selectDate(context, informationviewmodel.birthDateController);
                      },
                    ),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.heightController,
                        hintText: babyHeight),
                    CustomInformationTextField(
                        onChanged: (p0) => informationviewmodel.changeVisible(),
                        controller: informationviewmodel.widthController,
                        hintText: babyWidth),
                    AspectRatio(aspectRatio: displayHeight(context) * 0.015),
                    Observer(builder: (context) {
                      return Visibility(
                        visible: informationviewmodel.isButtonVisibleInf,
                        child: CustomButton(
                          text: const Text(babyContinue, style: TextStyle(color: cwhite)),
                          onPressed: () {
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

// class InformationPage extends StatelessWidget {
//   const InformationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController nameController = TextEditingController();
//     TextEditingController birthDateController = TextEditingController();
//     TextEditingController heightController = TextEditingController();
//     TextEditingController widthController = TextEditingController();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             AspectRatio(aspectRatio: displayHeight(context) * 0.01),
//             ClipRRect(
//               child: Image.asset('assets/images/picker.png', height: displayHeight(context) * 0.2),
//             ),
//             AspectRatio(aspectRatio: displayHeight(context) * 0.015),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/girlbw.png', height: displayHeight(context) * 0.06),
//                 Image.asset('assets/images/boybw.png', height: displayHeight(context) * 0.06),
//               ],
//             ),
//             AspectRatio(aspectRatio: displayHeight(context) * 0.02),
//             CustomInformationTextField(controller: nameController, hintText: babyFullName),
//             CustomInformationTextField(controller: birthDateController, hintText: babyBirthDate),
//             CustomInformationTextField(controller: heightController, hintText: babyHeight),
//             CustomInformationTextField(controller: widthController, hintText: babyWidth),
//             AspectRatio(aspectRatio: displayHeight(context) * 0.015),
//             CustomButton(
//               text: const Text(babyContinue, style: TextStyle(color: cwhite)),
//               onPressed: () {},
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Container(
// //               width: displayWidth(context) * 0.3130,
// //               height: displayHeight(context) * 0.1459,
// //               decoration: const ShapeDecoration(
// //                 shape: OvalBorder(
// //                   side: BorderSide(width: 1, color: Colors.purple),
// //                 ),
// //               ),
// //             )

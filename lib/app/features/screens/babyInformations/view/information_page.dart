import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_widgets/custom_information_textfield.dart';
import '../../../../core/constants/text_constants.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController birthDateController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController widthController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AspectRatio(aspectRatio: displayHeight(context) * 0.01),
            ClipRRect(
              child: Image.asset('assets/images/picker.png', height: displayHeight(context) * 0.2),
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
            CustomInformationTextField(controller: nameController, hintText: babyFullName),
            CustomInformationTextField(controller: birthDateController, hintText: babyBirthDate),
            CustomInformationTextField(controller: heightController, hintText: babyHeight),
            CustomInformationTextField(controller: widthController, hintText: babyWidth),
            AspectRatio(aspectRatio: displayHeight(context) * 0.015),
            CustomButton(
              text: const Text(babyContinue, style: TextStyle(color: cwhite)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
// Container(
//               width: displayWidth(context) * 0.3130,
//               height: displayHeight(context) * 0.1459,
//               decoration: const ShapeDecoration(
//                 shape: OvalBorder(
//                   side: BorderSide(width: 1, color: Colors.purple),
//                 ),
//               ),
//             )
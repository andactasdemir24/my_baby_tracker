// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_list_page.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../theme/baby_icons.dart';

class CustomSymptompsList extends StatelessWidget {
  const CustomSymptompsList({
    Key? key,
    required this.text,
  }) : super(key: key);

  final Text text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SymptompsList(),
            ),
          );
        },
        child: Container(
          width: displayWidth(context) * 0.8878,
          height: displayHeight(context) * 0.082,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: annualColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (context) {
                      return text;
                    },
                  ),
                  const Icon(Baby.left, color: settingsIndex)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

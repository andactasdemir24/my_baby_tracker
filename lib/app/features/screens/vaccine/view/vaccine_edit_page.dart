// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:baby_tracker_app/app/core/hive/model/vaccine_model.dart';
import 'package:baby_tracker_app/app/features/screens/vaccine/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/features/screens/vaccine/viewmodel/vaccine_viewmodel.dart';

import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../Informations/widgets/custom_information_textfield.dart';

class VaccineEdit extends StatefulWidget {
  const VaccineEdit({
    Key? key,
    required this.id,
    required this.date,
    required this.vaccine,
    required this.note,
    required this.createdTime,
  }) : super(key: key);

  final String id;
  final String date;
  final String vaccine;
  final String note;
  final DateTime createdTime;

  @override
  State<VaccineEdit> createState() => _VaccineEditState();
}

class _VaccineEditState extends State<VaccineEdit> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _vaccineController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  var vaccineViewModel = locator.get<VaccineViewModel>();

  @override
  void initState() {
    _dateController.text = widget.date;
    _vaccineController.text = widget.vaccine;
    _noteController.text = widget.note;
    super.initState();
    vaccineViewModel.dateController.text = _dateController.text;
    vaccineViewModel.vaccineController.text = _vaccineController.text;
    vaccineViewModel.noteController.text = _noteController.text;
  }

  @override
  void dispose() {
    _dateController.dispose();
    _vaccineController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: vaccineAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                CustomInformationTextField(
                  onChanged: (p0) => vaccineViewModel.changeVisible(),
                  controller: vaccineViewModel.dateController,
                  hintText: widget.date,
                  hintStyle: const TextStyle(color: cblack),
                  textInputType: TextInputType.none,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onTap: () {
                    vaccineViewModel.selectDate(context, vaccineViewModel.dateController);
                  },
                ),
                CustomDropdownButton(vaccineViewModel: vaccineViewModel, text: _vaccineController.text, color: cblack),
                CustomNoteTextfield(
                  controller: _noteController,
                  onChanged: (p0) => vaccineViewModel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return CustomButton(
                        text: const Text(update, style: TextStyle(color: cwhite)),
                        onPressed: () {
                          var value = Vaccine(
                              id: widget.id,
                              date: vaccineViewModel.dateController.text,
                              vaccine: vaccineViewModel.vaccineController.text,
                              text: _noteController.text,
                              createdTime: widget.createdTime);
                          vaccineViewModel.updateVaccine(value);
                          vaccineViewModel.toggleBlur(context);
                        });
                  },
                )
              ],
            )),
            if (vaccineViewModel.isBlurred)
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
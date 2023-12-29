// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/features/model/symptomps_model_f.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/viewmodel/symptomps_viewmodel.dart';
import 'package:baby_tracker_app/app/features/theme/baby_icons.dart';
import '../../../../core/components/custom_widgets/custom_button.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/custom_sypmtomps_container.dart';

class SymptompsPageEdit extends StatefulWidget {
  const SymptompsPageEdit({
    Key? key,
    required this.id,
    required this.symTime,
    required this.sympList,
    required this.note,
  }) : super(key: key);

  final String id;
  final DateTime symTime;
  final List<SymptopmsModel> sympList;
  final String note;

  @override
  State<SymptompsPageEdit> createState() => _SymptompsPageEditState();
}

class _SymptompsPageEditState extends State<SymptompsPageEdit> {
  final TextEditingController noteController = TextEditingController();
  final symptompsViewmodel = locator.get<SymptompsViewmodel>();

  @override
  void initState() {
    noteController.text = widget.note;
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(symptomos,
              style: TextStyle(
                  color: getPremiumTextColor, fontSize: 27, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Baby.right))),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      symptompsViewmodel.selectTime3(context);
                      symptompsViewmodel.changeVisible();
                    },
                    child: CustomTimePicker(
                      text: symptompsViewmodel.time3 != null
                          ? symptompsViewmodel.time3!.format(context)
                          : '${widget.symTime.hour.toString()}:${widget.symTime.minute.toString().padLeft(2, '0')}',
                      color: cblack,
                    )),
                CustomSymptompsList(
                    text: Text(
                  symptompsViewmodel.selectedIndices.isEmpty
                      ? widget.sympList.map((e) => e.name).join(', ')
                      : symptompsViewmodel.selectedIndices.map((index) => index.name).join(', '),
                  style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: cblack),
                )),
                CustomNoteTextfield(
                  controller: noteController,
                  onChanged: (p0) => symptompsViewmodel.changeVisible(),
                ),
                SizedBox(height: displayHeight(context) * 0.2),
                Observer(
                  builder: (context) {
                    return CustomButton(
                      text: const Text(update, style: TextStyle(color: cwhite)),
                      onPressed: () {
                        var value = Symptomps(
                            id: widget.id,
                            symTime: widget.symTime,
                            sympList: symptompsViewmodel.selectedIndices,
                            text: noteController.text);
                        symptompsViewmodel.updateSymptomps(value);
                        symptompsViewmodel.toggleBlur4(context);
                      },
                    );
                  },
                )
              ],
            )),
            if (symptompsViewmodel.isBlurred4)
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

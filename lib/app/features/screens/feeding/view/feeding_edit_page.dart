// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_button.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/viewmodel/feeding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/components/custom_widgets/amount_textfield.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';

class FeedingEdit extends StatefulWidget {
  const FeedingEdit({
    Key? key,
    required this.id,
    required this.time,
    required this.amount,
    required this.note,
  }) : super(key: key);

  final String id;
  final DateTime time;
  final int amount;
  final String note;

  @override
  State<FeedingEdit> createState() => _FeedingEditState();
}

class _FeedingEditState extends State<FeedingEdit> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final viewmodel = locator.get<FeedingViewModel>();

  @override
  void initState() {
    _amountController.text = widget.amount.toString();
    _noteController.text = widget.note;
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: feedingAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        viewmodel.selectTime(context);
                        viewmodel.changeVisible();
                      },
                      child: CustomTimePicker(
                          text: viewmodel.time != null
                              ? viewmodel.time!.format(context)
                              : '${widget.time.hour.toString()}:${widget.time.minute.toString()}',
                          color: cblack),
                    ),
                    AmountTextField(controller: _amountController),
                    CustomNoteTextfield(
                      controller: _noteController,
                      onChanged: (p0) => viewmodel.changeVisible(),
                    ),
                    SizedBox(height: displayHeight(context) * 0.2),
                    Observer(builder: (context) {
                      return CustomButton(
                        text: const Text(update, style: TextStyle(color: cwhite)),
                        onPressed: () {
                          try {
                            int.parse(_amountController.text);
                          } catch (e) {
                            viewmodel.showMyDialog(context);
                            return;
                          }
                          var value = Feeding(
                              id: widget.id,
                              time: widget.time,
                              amount: int.parse(_amountController.text),
                              text: _noteController.text);
                          viewmodel.updateFeeding(value);
                          viewmodel.toggleBlur(context);
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
            if (viewmodel.isBlurred)
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class FeedingEdit extends StatefulWidget {
  const FeedingEdit({
    Key? key,
    required this.id,
    required this.time,
    required this.amount,
    required this.note,
    required this.createdTime,
  }) : super(key: key);

  final String id;
  final DateTime time;
  final int amount;
  final String note;
  final DateTime createdTime;

  @override
  State<FeedingEdit> createState() => _FeedingEditState();
}

class _FeedingEditState extends State<FeedingEdit> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final viewmodel = locator.get<FeedingViewModel>();

  @override
  void initState() {
    super.initState();
    _amountController.text = widget.amount.toString();
    _noteController.text = widget.note;
    viewmodel.time = TimeOfDay(hour: widget.time.hour, minute: widget.time.minute);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.feedingAppbar),
        body: Observer(builder: (context) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
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
                              color: ColorConst.cblack),
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        AmountTextField(controller: _amountController),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: _noteController,
                          onChanged: (p0) => viewmodel.changeVisible(),
                        ),
                        const Spacer(),
                        CustomButton(
                          text: Text(AppLocalizations.of(context)!.update, style: TextStyle(color: ColorConst.cwhite)),
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
                              text: _noteController.text,
                              createdTime: widget.createdTime,
                            );
                            viewmodel.updateFeeding(value);
                            viewmodel.toggleBlur(context);
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.035),
                      ],
                    ),
                  )
                ],
              ),
              if (viewmodel.isBlurred)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                        color: ColorConst.cblack.withOpacity(0),
                        child: Center(child: Lottie.asset(ImagesConst.lottie))),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}

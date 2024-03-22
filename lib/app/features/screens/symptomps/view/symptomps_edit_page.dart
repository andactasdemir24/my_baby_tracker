// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class SymptompsPageEdit extends StatefulWidget {
  const SymptompsPageEdit({
    super.key,
    required this.id,
    required this.symTime,
    required this.sympList,
    required this.note,
    required this.createdTime,
  });

  final String id;
  final DateTime symTime;
  final List<SymptopmsModel> sympList;
  final String note;
  final DateTime createdTime;

  @override
  State<SymptompsPageEdit> createState() => _SymptompsPageEditState();
}

class _SymptompsPageEditState extends State<SymptompsPageEdit> {
  final TextEditingController noteController = TextEditingController();
  final symptompsViewmodel = locator.get<SymptompsViewmodel>();

  @override
  void initState() {
    super.initState();
    noteController.text = widget.note;
    symptompsViewmodel.selectedIndices.clear();
    symptompsViewmodel.selectedIndices.addAll(widget.sympList);
    symptompsViewmodel.time3 = TimeOfDay(hour: widget.symTime.hour, minute: widget.symTime.minute);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.symptomos,
                style: TextStyle(color: ColorConst.getPremiumTextColor, fontSize: 27, fontWeight: FontWeight.w600)),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Baby.right))),
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
                              symptompsViewmodel.selectTime3(context);
                              symptompsViewmodel.changeVisible();
                            },
                            child: CustomTimePicker(
                              text: symptompsViewmodel.time3 != null
                                  ? symptompsViewmodel.time3!.format(context)
                                  : '${widget.symTime.hour.toString()}:${widget.symTime.minute.toString().padLeft(2, '0')}',
                              color: ColorConst.cblack,
                            )),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomSymptompsList(
                            text: Text(
                          symptompsViewmodel.selectedIndices.isEmpty
                              ? widget.sympList.map((e) => e.name).join(', ')
                              : symptompsViewmodel.selectedIndices.map((index) => index.name).join(', '),
                          style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: ColorConst.cblack),
                        )),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: noteController,
                          onChanged: (p0) => symptompsViewmodel.changeVisible(),
                        ),
                        const Spacer(),
                        CustomButton(
                          text: Text(AppLocalizations.of(context)!.update, style: TextStyle(color: ColorConst.cwhite)),
                          onPressed: () {
                            var value = Symptomps(
                              id: widget.id,
                              symTime: widget.symTime,
                              sympList: symptompsViewmodel.selectedIndices,
                              text: noteController.text,
                              createdTime: widget.createdTime,
                            );
                            symptompsViewmodel.updateSymptomps(value);
                            symptompsViewmodel.toggleBlur4(context);
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.035),
                      ],
                    ),
                  )
                ],
              ),
              if (symptompsViewmodel.isBlurred4)
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

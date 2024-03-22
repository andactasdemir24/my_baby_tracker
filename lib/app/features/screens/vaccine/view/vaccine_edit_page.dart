// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

class VaccineEdit extends StatefulWidget {
  const VaccineEdit({
    super.key,
    required this.id,
    required this.date,
    required this.vaccine,
    required this.note,
    required this.createdTime,
  });

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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.vaccineAppbar),
        body: Observer(builder: (context) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        CustomVaccineTextField(
                          onChanged: (p0) => vaccineViewModel.changeVisible(),
                          controller: vaccineViewModel.dateController,
                          hintText: widget.date,
                          hintStyle: TextStyle(color: ColorConst.cblack),
                          textInputType: TextInputType.none,
                          textStyle: const TextStyle(fontWeight: FontWeight.bold),
                          onTap: () {
                            vaccineViewModel.selectDate(context, vaccineViewModel.dateController);
                          },
                        ),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomDropdownButton(
                            vaccineViewModel: vaccineViewModel,
                            text: _vaccineController.text,
                            color: ColorConst.cblack),
                        SizedBox(height: displayHeight(context) * 0.01),
                        CustomNoteTextfield(
                          controller: _noteController,
                          onChanged: (p0) => vaccineViewModel.changeVisible(),
                        ),
                        const Spacer(),
                        CustomButton(
                            text:
                                Text(AppLocalizations.of(context)!.update, style: TextStyle(color: ColorConst.cwhite)),
                            onPressed: () {
                              var value = Vaccine(
                                  id: widget.id,
                                  date: vaccineViewModel.dateController.text,
                                  vaccine: vaccineViewModel.vaccineController.text,
                                  text: _noteController.text,
                                  createdTime: widget.createdTime);
                              vaccineViewModel.updateVaccine(value);
                              vaccineViewModel.toggleBlur(context);
                            }),
                        SizedBox(height: displayHeight(context) * 0.035),
                      ],
                    ),
                  )
                ],
              ),
              if (vaccineViewModel.isBlurred)
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

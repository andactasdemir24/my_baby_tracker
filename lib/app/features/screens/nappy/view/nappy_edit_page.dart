import 'dart:ui';
import 'package:baby_tracker_app/app/core/hive/model/nappy_model.dart';
import 'package:baby_tracker_app/app/features/model/nappy_model_f.dart';
import 'package:baby_tracker_app/app/features/screens/nappy/viewmodel/nappy_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/components/custom_widgets/custom_appbar.dart';
import '../../../../core/components/custom_widgets/custom_button.dart';
import '../../../../core/components/custom_widgets/note_textfield.dart';
import '../../../../core/components/custom_widgets/time_picker.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../widgets/custom_nappy_container.dart';

class NappyPageEdit extends StatefulWidget {
  const NappyPageEdit({
    Key? key,
    required this.id,
    required this.nappyTime,
    required this.napList,
    required this.note,
    required this.createdTime,
  }) : super(key: key);

  final String id;
  final DateTime nappyTime;
  final List<NappyModel> napList;
  final String note;
  final DateTime createdTime;

  @override
  State<NappyPageEdit> createState() => _NappyPageEditState();
}

class _NappyPageEditState extends State<NappyPageEdit> {
  final TextEditingController noteController = TextEditingController();
  final nappyViewmodel = locator.get<NappyViewModel>();

  @override
  void initState() {
    super.initState();
    noteController.text = widget.note;
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: nappyAppbar),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Column(
              children: [
                GestureDetector(
                    onTap: () {
                      nappyViewmodel.selectTime4(context);
                      nappyViewmodel.changeVisibleNappy();
                    },
                    child: CustomTimePicker(
                      text: nappyViewmodel.time4 != null
                          ? nappyViewmodel.time4!.format(context)
                          : '${widget.nappyTime.hour.toString()}:${widget.nappyTime.minute.toString().padLeft(2, '0')}',
                      color: cblack,
                    )),
                SizedBox(height: displayHeight(context) * 0.02),
                SizedBox(
                  width: displayWidth(context) * 0.85,
                  child: const Text(nappyStatus,
                      style: TextStyle(color: cblack, fontSize: 15.5, fontWeight: FontWeight.bold)),
                ),
                CustomNappyList(
                    text: Text(
                  nappyViewmodel.selectedIndicess.isEmpty
                      ? widget.napList.map((e) => e.name).join(', ')
                      : nappyViewmodel.selectedIndicess.map((index) => index.name).join(', '),
                  style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: cblack),
                )),
                CustomNoteTextfield(
                  controller: noteController,
                  onChanged: (p0) => nappyViewmodel.changeVisibleNappy(),
                ),
                SizedBox(height: displayHeight(context) * 0.1),
                Observer(
                  builder: (context) {
                    return CustomButton(
                      text: const Text(update, style: TextStyle(color: cwhite)),
                      onPressed: () {
                        var updatedNappy = Nappy(
                          id: widget.id,
                          nappyTime: widget.nappyTime,
                          napList: nappyViewmodel.selectedIndicess,
                          text: noteController.text,
                          createdTime: widget.createdTime, // Bu değeri kullanın
                        );
                        nappyViewmodel.updateNappy(updatedNappy);
                        nappyViewmodel.toggleBlur5(context);
                      },
                    );
                  },
                )
              ],
            )),
            if (nappyViewmodel.isBlurred)
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

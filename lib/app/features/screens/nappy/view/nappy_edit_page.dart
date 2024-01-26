import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:baby_tracker_app/app/app.dart';

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
    nappyViewmodel.selectedIndicess.clear();
    nappyViewmodel.selectedIndicess.addAll(widget.napList);
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(appbarText: AppLocalizations.of(context)!.nappyAppbar),
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
                  child: Text(AppLocalizations.of(context)!.nappyStatus,
                      style: const TextStyle(color: cblack, fontSize: 15.5, fontWeight: FontWeight.bold)),
                ),
                CustomNappyList(
                    text: Text(
                  nappyViewmodel.selectedIndicess.isEmpty
                      ? widget.napList.map((e) => e.name).join(', ')
                      : nappyViewmodel.selectedIndicess.map((index) => index.name).join(', '),
                  style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold, color: cblack),
                )),
                SizedBox(height: displayHeight(context) * 0.02),
                CustomNoteTextfield(
                  controller: noteController,
                  onChanged: (p0) => nappyViewmodel.changeVisibleNappy(),
                ),
                SizedBox(height: displayHeight(context) * 0.15),
                Observer(
                  builder: (context) {
                    return CustomButton(
                      text: Text(AppLocalizations.of(context)!.update, style: const TextStyle(color: cwhite)),
                      onPressed: () {
                        var updatedNappy = Nappy(
                          id: widget.id,
                          nappyTime: widget.nappyTime,
                          napList: nappyViewmodel.selectedIndicess,
                          text: noteController.text,
                          createdTime: widget.createdTime,
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

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomSymptompsListView extends StatelessWidget {
  const CustomSymptompsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      if (calenderViewmodel.symptompsList.isNotEmpty) {
        return ListView.builder(
          itemCount: calenderViewmodel.symptompsList.length,
          itemBuilder: (context, index) {
            var symptomps = calenderViewmodel.symptompsList[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
              child: Column(
                children: [
                  Center(
                      child: Dismissible(
                    key: Key(symptomps.id!),
                    background: Container(
                      color: ColorConst.cred,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.delete, color: ColorConst.cwhite),
                    ),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      calenderViewmodel.deleteSymptomps(symptomps.id!);
                    },
                    child: GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymptompsPageEdit(
                                  id: symptomps.id!,
                                  symTime: symptomps.symTime!,
                                  sympList: symptomps.sympList!,
                                  note: symptomps.text!,
                                  createdTime: symptomps.createdTime!,
                                ),
                              ));
                        },
                        onTap: () {
                          calenderViewmodel.toogleSelected2(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                          width: displayWidth(context) * 0.9,
                          height: symptomps.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConst.annualColor,
                          ),
                          alignment: Alignment.center,
                          child: !symptomps.isSelected ? notpress(symptomps) : whenipress(symptomps, context),
                        )),
                  )),
                ],
              ),
            );
          },
        );
      } else {
        return CustomNoDataWidget(image: ImagesConst.noDataImage, text: AppLocalizations.of(context)!.noDataText);
      }
    });
  }

  ListTile notpress(Symptomps symptomps) {
    return ListTile(
      leading: Icon(Baby.symptoms, size: 50.spMin, color: ColorConst.symptompsTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(symptomps.sympList!.map((e) => e.name).join(', '),
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor)),
          Text(
              '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Symptomps symptomps, BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Icon(Baby.symptoms, size: 50.spMin, color: ColorConst.symptompsTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(symptomps.sympList!.map((e) => e.name).join(', '),
                style:
                    TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor)),
            Flexible(
              child: Text(
                  '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
            ),
            Text('${AppLocalizations.of(context)!.note}: ${symptomps.text.toString()}',
                style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

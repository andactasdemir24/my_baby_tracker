import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_nodata.dart';
import 'package:baby_tracker_app/app/features/screens/symptomps/view/symptomps_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/calender_viewmodel.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(symptomps.id!),
                        background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite),
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
                              width: displayWidth(context) * 0.8878,
                              height:
                                  symptomps.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !symptomps.isSelected ? notpress(symptomps) : whenipress(symptomps),
                            )),
                      );
                    },
                  )),
                ],
              ),
            );
          },
        );
      } else {
        return const CustomNoDataWidget(image: noDataImage, text: noDataText);
      }
    });
  }

  ListTile notpress(Symptomps symptomps) {
    return ListTile(
      leading: const Icon(Baby.symptoms, size: 50, color: symptompsTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(symptomps.sympList!.map((e) => e.name).join(', '),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
          Text(
              '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Symptomps symptomps) {
    return SingleChildScrollView(
      child: ListTile(
        leading: const Icon(Baby.symptoms, size: 50, color: symptompsTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(symptomps.sympList!.map((e) => e.name).join(', '),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
            Flexible(
              child: Text(
                  '${symptomps.symTime!.hour.toString().padLeft(2, '0')}:${symptomps.symTime!.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
            ),
            Text('Note: ${symptomps.text.toString()}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

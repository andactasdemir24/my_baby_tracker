import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_nodata.dart';
import 'package:baby_tracker_app/app/core/hive/model/vaccine_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../../vaccine/view/vaccine_edit_page.dart';
import '../viewmodel/calender_viewmodel.dart';

class CustomVaccineListView extends StatelessWidget {
  const CustomVaccineListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      if (calenderViewmodel.vaccineList.isNotEmpty) {
        return ListView.builder(
          itemCount: calenderViewmodel.vaccineList.length,
          itemBuilder: (context, index) {
            var vaccine = calenderViewmodel.vaccineList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(vaccine.id!),
                        background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          calenderViewmodel.deleteVaccine(vaccine.id!);
                        },
                        child: GestureDetector(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VaccineEdit(
                                      id: vaccine.id!,
                                      date: vaccine.date!,
                                      vaccine: vaccine.vaccine!,
                                      note: vaccine.text!,
                                      createdTime: vaccine.createdTime!,
                                    ),
                                  ));
                            },
                            onTap: () {
                              calenderViewmodel.toggleSelected4(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              width: displayWidth(context) * 0.8878,
                              height: vaccine.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !vaccine.isSelected ? notpress(vaccine) : whenipress(vaccine),
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

  ListTile notpress(Vaccine vaccine) {
    return ListTile(
      leading: const Icon(Baby.vaccine3, size: 40, color: vaccineTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${vaccine.vaccine}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
          Text('${vaccine.date}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Vaccine vaccine) {
    return SingleChildScrollView(
      child: ListTile(
        leading: const Icon(Baby.vaccine3, size: 40, color: vaccineTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${vaccine.vaccine}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
            Text('${vaccine.date}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(
              'Note: ${vaccine.text.toString()}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

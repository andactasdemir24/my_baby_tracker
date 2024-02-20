import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

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
              padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(vaccine.id!),
                        background: Container(
                          color: ColorConst.cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: ColorConst.cwhite),
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
                              width: displayWidth(context) * 0.9,
                              height: vaccine.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConst.annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !vaccine.isSelected ? notpress(vaccine) : whenipress(vaccine, context),
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
        return CustomNoDataWidget(image: ImagesConst.noDataImage, text: AppLocalizations.of(context)!.noDataText);
      }
    });
  }

  ListTile notpress(Vaccine vaccine) {
    return ListTile(
      leading: Icon(Baby.syringe2, size: 50.spMin, color: ColorConst.vaccineTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${vaccine.vaccine}',
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor)),
          Text('${vaccine.date}', style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Vaccine vaccine, BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Icon(Baby.syringe2, size: 50.spMin, color: ColorConst.vaccineTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${vaccine.vaccine}',
                style:
                    TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor)),
            Text('${vaccine.date}', style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold)),
            Text(
              '${AppLocalizations.of(context)!.note}: ${vaccine.text.toString()}',
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

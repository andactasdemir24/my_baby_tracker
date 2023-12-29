import 'package:baby_tracker_app/app/core/getIt/locator.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:baby_tracker_app/app/features/screens/calender/viewmodel/calender_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../theme/baby_icons.dart';
import '../../feeding/view/feeding_edit_page.dart';
import '../../sleep/view/sleep_edit_page.dart';
import '../../symptomps/view/symptomps_edit_page.dart';

class CustomAllListview extends StatelessWidget {
  const CustomAllListview({super.key});

  @override
  Widget build(BuildContext context) {
    final allviewmodel = locator.get<CalenderViewModel>();
    allviewmodel.groupItemsByType();

    return Scaffold(
      body: Observer(
        builder: (context) {
          return ListView(
            children: allviewmodel.groupedItems.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    child: Text(
                      entry.key,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: mainIconColor),
                    ),
                  ),
                  ...entry.value.map((all) => _buildItem(context, all, allviewmodel)).toList(),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, dynamic all, CalenderViewModel allviewmodel) {
    switch (all.runtimeType) {
      case Feeding:
        return Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(all.id!),
                      background: Container(
                        color: cred,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: const Icon(Icons.delete, color: cwhite),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        allviewmodel.deleteFeeding(all.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      FeedingEdit(id: all.id!, time: all.time!, amount: all.amount!, note: all.text!),
                                ));
                          },
                          child: Container(
                              width: displayWidth(context) * 0.8878,
                              height: displayHeight(context) * 0.14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: ListTile(
                                leading: const Icon(Baby.feed, size: 50, color: mainIconColor),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${all.amount} (ml)', style: customTextStyle()),
                                        Flexible(
                                            child: Text(
                                                '${all.time?.hour.toString().padLeft(2, '0')}:${all.time?.minute.toString().padLeft(2, '0')}',
                                                style: customTextStyle2()))
                                      ],
                                    ),
                                    Text('Note: ${all.text.toString()}',
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ))),
                    );
                  },
                )),
              ],
            ),
          );
        });
      case Sleep:
        return Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(all.id!),
                      background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite)),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        allviewmodel.deleteSleep(all.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SleepPageEdit(
                                          id: all.id!,
                                          feelSleep: all.fellSleep!,
                                          wokeUp: all.wokeUp!,
                                          note: all.text!,
                                        )));
                          },
                          child: Container(
                              width: displayWidth(context) * 0.8878,
                              height: displayHeight(context) * 0.14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: ListTile(
                                  leading: const Icon(Baby.sleep, size: 50, color: mainIconColor),
                                  title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Feel sleep:', style: customTextStyle()),
                                          Flexible(
                                              child: Text(
                                                  '${all.fellSleep!.hour.toString().padLeft(2, '0')}:${all.fellSleep!.minute.toString().padLeft(2, '0')}',
                                                  style: customTextStyle2())),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Woke up:', style: customTextStyle()),
                                          Flexible(
                                            child: Text(
                                                '${all.wokeUp?.hour.toString().padLeft(2, '0')}:${all.wokeUp?.minute.toString().padLeft(2, '0')}',
                                                style: customTextStyle2()),
                                          ),
                                        ],
                                      ),
                                      Text('Note: ${all.text.toString()}', style: customTextStyle3()),
                                    ],
                                  )))),
                    );
                  },
                )),
              ],
            ),
          );
        });
      case Symptomps:
        return Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Center(child: Observer(
                  builder: (context) {
                    return Dismissible(
                      key: Key(all.id!),
                      background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite)),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        allviewmodel.deleteSymptomps(all.id!);
                      },
                      child: GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SymptompsPageEdit(
                                        id: all.id!, symTime: all.symTime!, sympList: all.sympList!, note: all.text!)));
                          },
                          child: Container(
                              width: displayWidth(context) * 0.8878,
                              height: displayHeight(context) * 0.14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: SingleChildScrollView(
                                child: ListTile(
                                  leading: const Icon(Baby.symptoms, size: 50, color: mainIconColor),
                                  title: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(all.sympList!.map((e) => e.name).join(', '), style: customTextStyle()),
                                          Flexible(
                                            child: Text(
                                                '${all.symTime!.hour.toString().padLeft(2, '0')}:${all.symTime!.minute.toString().padLeft(2, '0')}',
                                                style: customTextStyle2()),
                                          ),
                                        ],
                                      ),
                                      Text('Note: ${all.text.toString()}', style: customTextStyle3()),
                                    ],
                                  ),
                                ),
                              ))),
                    );
                  },
                )),
              ],
            ),
          );
        });
      default:
        return const Text('You dont have any data');
    }
  }

  TextStyle customTextStyle3() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }

  TextStyle customTextStyle2() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);
  }

  TextStyle customTextStyle() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor);
  }
}

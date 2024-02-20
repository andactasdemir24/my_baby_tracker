import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomAllListview extends StatelessWidget {
  const CustomAllListview({super.key});

  @override
  Widget build(BuildContext context) {
    final allviewmodel = locator.get<CalenderViewModel>();
    allviewmodel.groupItemsByType();

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (allviewmodel.allList.isNotEmpty) {
            return ListView(
              children: allviewmodel.groupedItems.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.06, vertical: 5),
                      child: Text(
                        entry.key,
                        style: TextStyle(
                            fontSize: 20.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor),
                      ),
                    ),
                    ...entry.value.map((all) => _buildItem(context, all, allviewmodel)).toList(),
                  ],
                );
              }).toList(),
            );
          } else {
            return CustomNoDataWidget(image: ImagesConst.noDataImage, text: AppLocalizations.of(context)!.noDataText);
          }
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, dynamic all, CalenderViewModel allviewmodel) {
    switch (all.runtimeType) {
      case Feeding:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
          child: Column(
            children: [
              Center(
                  child: Dismissible(
                key: Key(all.id!),
                background: Container(
                  color: ColorConst.cred,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.delete, color: ColorConst.cwhite),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  allviewmodel.deleteFeeding(all.id!);
                },
                child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedingEdit(
                              id: all.id!,
                              time: all.time!,
                              amount: all.amount!,
                              note: all.text!,
                              createdTime: all.createdTime!,
                            ),
                          ));
                    },
                    child: Container(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConst.annualColor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: Icon(Baby.feed, size: 50.spMin, color: ColorConst.feedingTab),
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
                              Text('${AppLocalizations.of(context)!.note}: ${all.text.toString()}',
                                  style: customTextStyle3()),
                            ],
                          ),
                        ))),
              )),
            ],
          ),
        );
      case Sleep:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
          child: Column(
            children: [
              Center(
                  child: Dismissible(
                key: Key(all.id!),
                background: Container(
                    color: ColorConst.cred,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: ColorConst.cwhite)),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  allviewmodel.deleteSleep(all.id!);
                },
                child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SleepPageEdit(
                                    id: all.id!,
                                    feelSleep: all.fellSleep!,
                                    wokeUp: all.wokeUp!,
                                    note: all.text!,
                                    createdTime: all.createdTime!,
                                  )));
                    },
                    child: Container(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConst.annualColor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                            leading: Icon(Baby.sleep, size: 50.spMin, color: ColorConst.sleepTab),
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
                                Text('${AppLocalizations.of(context)!.note}: ${all.text.toString()}',
                                    style: customTextStyle3()),
                              ],
                            )))),
              ))
            ],
          ),
        );
      case Symptomps:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
          child: Column(
            children: [
              Center(
                  child: Dismissible(
                key: Key(all.id!),
                background: Container(
                    color: ColorConst.cred,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: ColorConst.cwhite)),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  allviewmodel.deleteSymptomps(all.id!);
                },
                child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SymptompsPageEdit(
                                    id: all.id!,
                                    symTime: all.symTime!,
                                    sympList: all.sympList!,
                                    note: all.text!,
                                    createdTime: all.createdTime!,
                                  )));
                    },
                    child: Container(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConst.annualColor,
                        ),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: ListTile(
                            leading: Icon(Baby.symptoms, size: 50.spMin, color: ColorConst.symptompsTab),
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
                                Text('${AppLocalizations.of(context)!.note}: ${all.text.toString()}',
                                    style: customTextStyle3()),
                              ],
                            ),
                          ),
                        ))),
              ))
            ],
          ),
        );
      case Nappy:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
          child: Column(
            children: [
              Center(
                  child: Dismissible(
                key: Key(all.id!),
                background: Container(
                    color: ColorConst.cred,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: ColorConst.cwhite)),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  allviewmodel.deleteNappy(all.id!);
                },
                child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NappyPageEdit(
                                id: all.id!,
                                nappyTime: all.nappyTime!,
                                napList: all.napList!,
                                note: all.text!,
                                createdTime: all.createdTime!),
                          ));
                    },
                    child: Container(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConst.annualColor,
                        ),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: ListTile(
                            leading: Icon(Baby.nappy, size: 50.spMin, color: ColorConst.nappyTab),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(all.napList!.map((e) => e.name).join(', '), style: customTextStyle()),
                                    Flexible(
                                      child: Text(
                                          '${all.nappyTime!.hour.toString().padLeft(2, '0')}:${all.nappyTime!.minute.toString().padLeft(2, '0')}',
                                          style: customTextStyle2()),
                                    ),
                                  ],
                                ),
                                Text('${AppLocalizations.of(context)!.note}: ${all.text.toString()}',
                                    style: customTextStyle3()),
                              ],
                            ),
                          ),
                        ))),
              ))
            ],
          ),
        );
      case Vaccine:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
          child: Column(
            children: [
              Center(
                  child: Dismissible(
                key: Key(all.id!),
                background: Container(
                  color: ColorConst.cred,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(Icons.delete, color: ColorConst.cwhite),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  allviewmodel.deleteVaccine(all.id!);
                },
                child: GestureDetector(
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VaccineEdit(
                              id: all.id!,
                              date: all.date!,
                              vaccine: all.vaccine!,
                              note: all.text!,
                              createdTime: all.createdTime!,
                            ),
                          ));
                    },
                    child: Container(
                        width: displayWidth(context) * 0.9,
                        height: displayHeight(context) * 0.13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorConst.annualColor,
                        ),
                        alignment: Alignment.center,
                        child: ListTile(
                          leading: Icon(Baby.syringe2, size: 50.spMin, color: ColorConst.vaccineTab),
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${all.vaccine}', style: customTextStyle()),
                              Text('${all.date}', style: customTextStyle2()),
                              Text('${AppLocalizations.of(context)!.note}: ${all.text.toString()}',
                                  style: customTextStyle3()),
                            ],
                          ),
                        ))),
              )),
            ],
          ),
        );
      default:
        return Text(AppLocalizations.of(context)!.anyData);
    }
  }

  TextStyle customTextStyle3() {
    return TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500);
  }

  TextStyle customTextStyle2() {
    return TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis);
  }

  TextStyle customTextStyle() {
    return TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.getPremiumTextColor);
  }
}

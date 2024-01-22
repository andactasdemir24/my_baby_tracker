import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomSleepListView extends StatelessWidget {
  const CustomSleepListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      if (calenderViewmodel.sleepList.isNotEmpty) {
        return ListView.builder(
          itemCount: calenderViewmodel.sleepList.length,
          itemBuilder: (context, index) {
            var sleep = calenderViewmodel.sleepList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(sleep.id!),
                        background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          calenderViewmodel.deleteSleep(sleep.id!);
                        },
                        child: GestureDetector(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SleepPageEdit(
                                            id: sleep.id!,
                                            feelSleep: sleep.fellSleep!,
                                            wokeUp: sleep.wokeUp!,
                                            note: sleep.text!,
                                            createdTime: sleep.createdTime!,
                                          )));
                            },
                            onTap: () {
                              calenderViewmodel.toggleSelected1(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              width: displayWidth(context) * 0.8878,
                              height: sleep.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !sleep.isSelected ? notpress(sleep) : whenipress(sleep),
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

  ListTile notpress(Sleep sleep) {
    return ListTile(
        leading: const Icon(Baby.sleep, size: 50, color: sleepTab),
        trailing: const Icon(Icons.arrow_circle_down_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Feel sleep:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: mainIconColor)),
                Text(
                    '${sleep.fellSleep!.hour.toString().padLeft(2, '0')}:${sleep.fellSleep!.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Woke up:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: mainIconColor)),
                Text(
                    '${sleep.wokeUp?.hour.toString().padLeft(2, '0')}:${sleep.wokeUp?.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ));
  }

  SingleChildScrollView whenipress(Sleep sleep) {
    return SingleChildScrollView(
      child: ListTile(
          leading: const Icon(Baby.sleep, size: 50, color: sleepTab),
          trailing: const Icon(Icons.arrow_circle_up_outlined),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Feel sleep:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                  Flexible(
                    child: Text(
                        '${sleep.fellSleep!.hour.toString().padLeft(2, '0')}:${sleep.fellSleep!.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Woke up:',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                  Flexible(
                    child: Text(
                        '${sleep.wokeUp?.hour.toString().padLeft(2, '0')}:${sleep.wokeUp?.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Text('Note: ${sleep.text.toString()}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          )),
    );
  }
}

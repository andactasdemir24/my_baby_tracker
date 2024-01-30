import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomFeedigListView extends StatelessWidget {
  const CustomFeedigListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      if (calenderViewmodel.feedingList.isNotEmpty) {
        return ListView.builder(
          itemCount: calenderViewmodel.feedingList.length,
          itemBuilder: (context, index) {
            var feeding = calenderViewmodel.feedingList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(feeding.id!),
                        background: Container(
                          color: ColorConst.cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: ColorConst.cwhite),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          calenderViewmodel.deleteFeeding(feeding.id!);
                        },
                        child: GestureDetector(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedingEdit(
                                      id: feeding.id!,
                                      time: feeding.time!,
                                      amount: feeding.amount!,
                                      note: feeding.text!,
                                      createdTime: feeding.createdTime!,
                                    ),
                                  ));
                            },
                            onTap: () {
                              calenderViewmodel.toggleSelected(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              width: displayWidth(context) * 0.8878,
                              height: feeding.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: ColorConst.annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !feeding.isSelected ? notpress(feeding) : whenipress(feeding, context),
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

  ListTile notpress(Feeding feeding) {
    return ListTile(
      leading: Icon(Baby.feed, size: 50, color: ColorConst.feedingTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${feeding.amount} (ml)',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorConst.mainIconColor)),
          Text('${feeding.time?.hour.toString().padLeft(2, '0')}:${feeding.time?.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Feeding feeding, BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Icon(Baby.feed, size: 50, color: ColorConst.feedingTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${feeding.amount} (ml)',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ColorConst.mainIconColor)),
                Text(
                  '${feeding.time?.hour.toString().padLeft(2, '0')}:${feeding.time?.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Text(
              '${AppLocalizations.of(context)!.note}: ${feeding.text.toString()}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

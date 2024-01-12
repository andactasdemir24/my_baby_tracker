import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/components/custom_widgets/custom_nodata.dart';
import 'package:baby_tracker_app/app/features/screens/feeding/view/feeding_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../theme/baby_icons.dart';
import '../viewmodel/calender_viewmodel.dart';

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
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite),
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
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !feeding.isSelected ? notpress(feeding) : whenipress(feeding),
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

  ListTile notpress(Feeding feeding) {
    return ListTile(
      leading: const Icon(Baby.feed, size: 50, color: feedingTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${feeding.amount} (ml)',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
          Text('${feeding.time?.hour.toString().padLeft(2, '0')}:${feeding.time?.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Feeding feeding) {
    return SingleChildScrollView(
      child: ListTile(
        leading: const Icon(Baby.feed, size: 50, color: feedingTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${feeding.amount} (ml)',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
                Text('Note: ${feeding.text.toString()}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
            Flexible(
              child: Text(
                '${feeding.time?.hour.toString().padLeft(2, '0')}:${feeding.time?.minute.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

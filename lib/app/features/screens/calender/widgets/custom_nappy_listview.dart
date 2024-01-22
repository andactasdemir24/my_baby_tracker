import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

class CustomNappyListView extends StatelessWidget {
  const CustomNappyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderViewmodel = locator.get<CalenderViewModel>();
    return Observer(builder: (context) {
      if (calenderViewmodel.nappyList.isNotEmpty) {
        return ListView.builder(
          itemCount: calenderViewmodel.nappyList.length,
          itemBuilder: (context, index) {
            var nappy = calenderViewmodel.nappyList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(nappy.id!),
                        background: Container(
                          color: cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: cwhite),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          calenderViewmodel.deleteNappy(nappy.id!);
                        },
                        child: GestureDetector(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NappyPageEdit(
                                        id: nappy.id!,
                                        nappyTime: nappy.nappyTime!,
                                        napList: nappy.napList!,
                                        note: nappy.text!,
                                        createdTime: nappy.createdTime!),
                                  ));
                            },
                            onTap: () {
                              calenderViewmodel.toogleSelected3(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                              width: displayWidth(context) * 0.8878,
                              height: nappy.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !nappy.isSelected ? notpress(nappy) : whenipress(nappy),
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

  ListTile notpress(Nappy nappys) {
    return ListTile(
      leading: const Icon(Baby.nappy, size: 50, color: nappyTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nappys.napList!.map((e) => e.name).join(', '),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
          Text(
              '${nappys.nappyTime!.hour.toString().padLeft(2, '0')}:${nappys.nappyTime!.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Nappy nappys) {
    return SingleChildScrollView(
      child: ListTile(
        leading: const Icon(Baby.nappy, size: 50, color: nappyTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nappys.napList!.map((e) => e.name).join(', '),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: mainIconColor)),
            Flexible(
              child: Text(
                  '${nappys.nappyTime!.hour.toString().padLeft(2, '0')}:${nappys.nappyTime!.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
            ),
            Text('Note: ${nappys.text.toString()}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

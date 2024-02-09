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
              padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.01, vertical: 5),
              child: Column(
                children: [
                  Center(child: Observer(
                    builder: (context) {
                      return Dismissible(
                        key: Key(nappy.id!),
                        background: Container(
                          color: ColorConst.cred,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: ColorConst.cwhite),
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
                              width: displayWidth(context) * 0.9,
                              height: nappy.isSelected ? displayHeight(context) * 0.15 : displayHeight(context) * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorConst.annualColor,
                              ),
                              alignment: Alignment.center,
                              child: !nappy.isSelected ? notpress(nappy) : whenipress(nappy, context),
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

  ListTile notpress(Nappy nappys) {
    return ListTile(
      leading: Icon(Baby.nappy, size: 50.spMin, color: ColorConst.nappyTab),
      trailing: const Icon(Icons.arrow_circle_down_outlined),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nappys.napList!.map((e) => e.name).join(', '),
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.mainIconColor)),
          Text(
              '${nappys.nappyTime!.hour.toString().padLeft(2, '0')}:${nappys.nappyTime!.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  SingleChildScrollView whenipress(Nappy nappys, BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Icon(Baby.nappy, size: 50.spMin, color: ColorConst.nappyTab),
        trailing: const Icon(Icons.arrow_circle_up_outlined),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nappys.napList!.map((e) => e.name).join(', '),
                style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, color: ColorConst.mainIconColor)),
            Flexible(
              child: Text(
                  '${nappys.nappyTime!.hour.toString().padLeft(2, '0')}:${nappys.nappyTime!.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis)),
            ),
            Text('${AppLocalizations.of(context)!.note}: ${nappys.text.toString()}',
                style: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

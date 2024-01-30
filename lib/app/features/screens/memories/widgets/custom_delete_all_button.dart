import 'package:baby_tracker_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDeleteAllButton extends StatelessWidget {
  const CustomDeleteAllButton({
    super.key,
    required this.memoriesViewmodel,
  });

  final MemoriesViewModel memoriesViewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
          onTap: () {
            memoriesViewmodel.clearAllMemories();
          },
          child: Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(AppLocalizations.of(context)!.deleteAll,
                  style: TextStyle(color: ColorConst.buttonColor, fontWeight: FontWeight.bold, fontSize: 15)),
            ),
          ));
    });
  }
}

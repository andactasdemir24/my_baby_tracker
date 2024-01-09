import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/color_constants.dart';
import '../viewmodel/memories_viewmodel.dart';

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
            child: const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Delete All',
                style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ));
    });
  }
}

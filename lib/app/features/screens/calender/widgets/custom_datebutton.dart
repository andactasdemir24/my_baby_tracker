import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../viewmodel/calender_viewmodel.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    super.key,
    required this.calenderViewmodel,
  });

  final CalenderViewModel calenderViewmodel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Center(
        child: TextButton(
          onPressed: () async {
            final date = await calenderViewmodel.pickDate(context);
            if (date == null) return;
            calenderViewmodel.dateTime = date;
          },
          child: Text(DateFormat('EEE, MMM d').format(calenderViewmodel.dateTime),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: cblack)),
        ),
      );
    });
  }
}
